require "test_helper"

class ExperimentTest < ActiveSupport::TestCase
  test "#perform" do
    skip
    r1 = Experiment.new.perform
    puts r1
  end
end
