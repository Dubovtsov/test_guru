# Preview all emails at http://localhost:3000/rails/mailers/tests_mailer
class TestsMailerPreview < ActionMailer::Preview
  def compleated_test
    test_passage = TestPassage.new(user: User.first, test: Test.first)

    TestsMailer.compleated_test(test_passage)
  end
end
