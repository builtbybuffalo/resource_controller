module Admin
  class ResourceController < Admin::BaseController
    respond_to :html

    before_action :load_collection, only: :index
    before_action :load_object, unless: -> { skip_preload.include? action_name.to_sym }

    def create
      @object.update_attributes(permitted_params)
      respond_with :admin, admin_responder
    end
    alias_method :update, :create

    def destroy
      flash[:notice] = "Successfully deleted resource" if @object.destroy

      redirect_to :back
    end

    def duplicatable?
      respond_to?(:duplicate)
    end
    helper_method :duplicatable?

    def update_positions
      unless [:id, :position].all? { |i| params[i].present? }
        return render json: { errors: "Model ID and new position are both required" }, status: :invalid_entity
      end

      model_class.find(params[:id]).set_list_position(params[:position])

      render json: "Success"
    end

    protected

    def admin_responder
      @object
    end

    def model_name
      self.class.to_s.demodulize.gsub(/Controller\Z/, "").singularize.underscore.humanize
    end
    helper_method :model_name

    def model_path
      model_class.name.underscore.parameterize("_")
    end
    helper_method :model_path

    def model_class
      class_name = self.class.to_s.match(/^Admin::(.*)Controller$/)[1].singularize
      class_name.constantize
    end

    def collection_scope
      model_class
    end

    def id_param
      params["#{model_path.underscore}_id"] || params[:id]
    end

    def search_params
      params[:q] || {}
    end

    def load_collection
      @q = collection_scope.ransack(search_params)
      @collection = @q.result(distinct: true).page(params[:page]).per(100)
      instance_variable_set("@#{model_path.pluralize.underscore}", @collection)
    end

    def load_object
      @object ||= if %w(new create).include? action_name
                    model_class.new
                  else
                    model_class.find id_param
                  end

      instance_variable_set("@#{model_path.underscore}", @object)
    end

    def collection_table_fields
      fields = Hash[model_class.attribute_names.map { |n| [n, n.humanize] }]
      fields["id"] = "ID"
      fields
    end
    helper_method :collection_table_fields

    def permitted_params
      params.require(model_path).permit!
    end

    # Define and return an array of action names that do not require
    # model objects to be preloaded by load_object
    def skip_preload
      ([:index, :update_positions] << (not_loadable_actions || [])).flatten.map(&:to_sym)
    end

    # This method is designed to be overwritten by inheriting classes.
    # Return an array of symbols or a symbol.
    def not_loadable_actions; end
  end
end
