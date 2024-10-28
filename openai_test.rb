require 'openai'

client = OpenAI::Client.new(
  api_key: "<api key here>",
  # log_errors: true # Highly recommended in development, so you can see what errors OpenAI is returning. Not recommended in production because it could leak private data to your logs.
)

prompt = "Generate a 7-day meal plan for a user with 2000 calories/day, high-protein, low-carb, vegetarian."

response = client.completions(prompt: prompt, engine: "davinci-002", max_tokens: 200)
puts response
meal_plan = response['choices'].first['text']
