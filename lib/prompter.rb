require_relative "prompter/version"

module Prompter
  class Error < StandardError; end

  def self.call(options)
    options[:interval] ||= 15
    options[:lines].shuffle! if options[:shuffle]

    animation_prompts = "animation_prompts = {\n"
    options[:lines].each_with_index do |line, index|
      frame = index * options[:interval]
      prompt = line.strip

      prompt = options[:prefix].to_s + prompt + options[:suffix].to_s
      prompt = prompt.gsub("\"", "\\\"")
      animation_prompts << "  #{frame}: \"#{prompt}\",\n"
    end
    animation_prompts << "}"
  end
end
