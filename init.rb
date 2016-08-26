require 'redmine'

require_dependency 'redmine_analytics_hooks'

Redmine::Plugin.register :redmine_analytics do
  name 'Redmine Analytics plugin'
  author 'IdeaCrew, Inc'
  description ''
  version '0.0.1'
  url 'https://github.com/dchbx/redmine_analytics'
  author_url 'http://ideacrew.com'
  settings :default => {
    'segment_write_key' => 'hcCngI9GjjD0FTVV1QKevoUxcFQASgkD',
  }, :partial => 'settings/analytic_settings'
end
