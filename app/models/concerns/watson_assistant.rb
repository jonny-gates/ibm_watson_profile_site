# require "ibm_watson/assistant_v2"
# include IBMWatson

class WatsonAssistant
  def initialize
    @service = IBMWatson::AssistantV2.new(
      version: "2019-02-28",
      iam_apikey: ENV['API_KEY'],
      url: ENV['API_URL']
    )
    new_session = @service.create_session(assistant_id: ENV['ASSISTANT_ID'])
    @session_id = new_session.result['session_id']
  end

  def send_message(message_input)
    response = @service.message(
      assistant_id: ENV['ASSISTANT_ID'],
      session_id: @session_id,
      input: {
        text: message_input
      }
    )
    response.result['output']['generic'][0]['text']
  end
end
