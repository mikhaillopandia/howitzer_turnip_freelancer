class SettingsPage < FreelancerPage
  path '/users/settings.php'
  validate :url, %r{/users/settings.php\?.+/?\z}
end
