

def load_library(emoticons)
  require "yaml"
  emoticons = YAML.load_file('./lib/emoticons.yml')
  new_hash = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticons.each do |k1, v1|
    new_hash["get_meaning"][v1[1]] = k1
    new_hash["get_emoticon"][v1[0]] = v1[1]
  end
  new_hash
end

def get_japanese_emoticon(emoticons, string)
  hash = load_library(emoticons)
  if hash["get_emoticon"].has_key?(string)
    hash["get_emoticon"][string]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(emoticons, string)
  hash = load_library(emoticons)
  if hash["get_meaning"].has_key?(string)
    hash["get_meaning"][string]
  else
    "Sorry, that emoticon was not found"
  end
end
