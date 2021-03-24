require "minitest/autorun"
require "minitest/reporters"

Minitest::Reporters.use!

describe "if I give the value of Summer and Evening" do
  before do
    @my_array = %w(Day Evening Replacer Summer Wekeend HighTB LowTB)
  end

  it "should return 'summer' and 'evening' from list" do
    assert_equal(@my_array.filter_tags(["Summer", "Evening"]), ["Summer", "Evening"])
  end
end

class Array # monkey patching into the Array class
  def filter_tags(tags)
    results = []
    array = ["Day", "Evening", "Replacer", "Summer", "Wekeend",
             "HighTB", "LowTB"]

    tags.each do |tag|
      results << array.detect { |item| item.include?(tag) }
    end

    return results
  end
end
