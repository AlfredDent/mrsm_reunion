require 'test_helper'

class DetailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @detail = Detail.new(name: "Farid", email: "farid@example.com", phone: "01132367441", attend: true, batch: "2010", seat: "2", allergy: "none", note: "none")
  end
  
  test "should be valid" do
    assert @detail.valid?
  end
  
  test "name should be present" do
    @detail.name = "       "
    assert_not @detail.valid?
  end
  
  test "email should be present" do
    @detail.email = "      "
    assert_not @detail.valid?
  end
  
  test "phone should be present" do
    @detail.phone = "      "
    assert_not @detail.valid?
  end
  
  test "attend should be present" do
    @detail.attend = nil
    assert_not @detail.valid?
  end
  
  test "batch should be present" do
    @detail.batch = "      "
    assert_not @detail.valid?
  end
  
  test "seat should be present" do
    @detail.seat = "      "
    assert_not @detail.valid?
  end
  
  test "name should not be too long" do
    @detail.name = "a" * 51
    assert_not @detail.valid?
  end
  
  test "email should not be too long" do
    @detail.email = "a" * 244 + "@example.com"
    assert_not @detail.valid?
  end
  
  test "email validation should accept valid addresses" do
    valid_addresses = %w[detail@example.com detail@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @detail.email = valid_address
      assert @detail.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[detail@example,com detail_at_foo.org detail.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @detail.email = invalid_address
      assert_not @detail.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  
  test "email addresses should be unique" do
    duplicate_detail = @detail.dup
    duplicate_detail.email = @detail.email.upcase
    @detail.save
    assert_not duplicate_detail.valid?
  end
  
    test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @detail.email = mixed_case_email
    @detail.save
    assert_equal mixed_case_email.downcase, @detail.reload.email
  end
  
end
