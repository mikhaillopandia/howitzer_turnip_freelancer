class VerifyPage < FreelancerPage
  path '/payments/verify.php'
  validate :url, %r{/payments/verify.php?.+/?\z}
end
