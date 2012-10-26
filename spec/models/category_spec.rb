require 'spec_helper'

describe Category do
  it {should respond_to(:content)}
  it {should respond_to(:product_id)}
end
