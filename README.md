# Install

`gem 'resource_controller', github: 'builtbybuffalo/resource_controller'`

## Dependencies

```
gem "nested_form_fields", github: "builtbybuffalo/nested_form_fields", branch: "html5-template"
gem 'ransack', github: 'activerecord-hackery/ransack'
```

## Routes

```
  namespace :admin do
    root to: redirect("your-root")
  end
```

## Read!

There are no access controls set by this gem. You will need to define them yourself.
