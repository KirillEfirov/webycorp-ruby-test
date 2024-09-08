# frozen_string_literal: true

# Pipe is a simple pipeline class used to manage and execute a series of steps.
# Each step must respond to the `call` method and can be added either as a block or a callable object.
# The `run` method executes all the steps in sequence, passing the result from one step to the next.
class Pipe
  attr_reader :steps

  def initialize(&config)
    @steps = []
    yield(self) and @steps.freeze if config
  end

  def step(callable = nil, &block)
    callable ||= block

    raise ArgumentError, 'Step must respond to #call' unless callable.respond_to?(:call)

    steps << callable
    self
  end

  def run(result = [])
    steps.reduce(result) { |r, step| step.call(r) }
  rescue Stripe::StripeError => e
    Application.logger.error("Request failed: #{e.message}")
    raise
  end
end
