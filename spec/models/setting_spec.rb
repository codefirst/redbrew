require 'spec_helper'

describe Setting do
  before do
    ENV.stub(:[]).with('param').and_return('value')
  end

  subject { Setting[:param] }

  it { should == 'value' }
end
