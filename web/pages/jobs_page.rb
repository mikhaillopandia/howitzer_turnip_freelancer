require_relative 'demo_app_page'

class JobsPage < DemoAppPage
  path '/jobs/myskills/'
  validate :title, /\AJobs Matching My Skills\s\s| Freelancer\z/
  validate :url, %r{freelancer.co.uk/jobs/myskills/?\z}
end
