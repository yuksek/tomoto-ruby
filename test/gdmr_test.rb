require_relative "test_helper"

class GDMRTest < Minitest::Test
  def test_works
    model = Tomoto::GDMR.new(degrees: [1])
    assert_kind_of Tomoto::DMR, model
    assert_kind_of Tomoto::LDA, model
    assert_in_delta 0.1, model.alpha
    assert_in_delta 0.01, model.eta
    assert_in_delta 1, model.sigma
    assert_in_delta 1e-10, model.alpha_epsilon
    assert_equal 2, model.f

    model.add_doc(["new", "document"], metadata: [1.0])
  end
end
