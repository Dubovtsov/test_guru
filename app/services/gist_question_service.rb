class GistQuestionService

  ROOT_ENDPOINT = 'https://api.github.com'
  ACCESS_TOKEN = 'd6fb1320cf9ea43bc8684892e2040138e9cf5e27'

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: "ACCESS_TOKEN")
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
      description: "A question about #{@test.title} from TestGuru",
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

end
