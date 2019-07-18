class TestsMailer < ApplicationMailer
  def compleated_test(test_passage)
    @user = test_passage.user
    @test = test_passage.test

    mail to: @user.email, subject: 'You just compleated the TestGuru test!'
  end
end
