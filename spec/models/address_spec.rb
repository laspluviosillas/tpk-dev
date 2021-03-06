require 'spec_helper'

describe Address do
  pending "add some examples to (or delete) #{__FILE__}"

  it "should associate with affiliates through addressable" do
    @address = Address.new(:street_line_1 => "123 Main St", :city => "Austin" , :state =>"TX", :zip => "78717")
    @affiliate = Affiliate.new(:company_name => "Technology Painkillers")
    @affiliate.addresses << @address
    @affiliate.save!
    # Test Count
    @affiliate.addresses.count.should == 1
    @address.addressable_type.should == "Affiliate"
    @address.addressable_id.should == @affiliate.id
  end
end
