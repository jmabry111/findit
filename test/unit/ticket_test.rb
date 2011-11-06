require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Factory.build(:ticket).valid?
  end
  
  test "test that a factory has to have a title" do
    ticket = Factory.build(:ticket, :title => '')
    assert !ticket.valid?, 'The ticket should be valid because it doesnt  have a title'
    ticket.title = 'Demo'
    assert ticket.valid?, 'the ticket should be valid now that it has a title'
  end
  
  test "test that a factory has a description" do
    ticket = Factory.build(:ticket, :description => '')
    assert !ticket.valid?, 'The ticket should be valid because it doesnt  have a description'
    ticket.description = 'Demo'
    assert ticket.valid?, 'the ticket should be valid now that it has a description'
  end
  
  test "test that a factory has a submitter" do
    ticket = Factory.build(:ticket, :submitter => nil)
    assert !ticket.valid?, 'The ticket should be valid because it doesnt have a submitter'
    ticket.submitter = Factory.build(:user)
    assert ticket.valid?, 'the ticket should be valid now that it has a submitter'
  end
  
  test "test that a factory has to have a status" do
    ticket = Factory.build(:ticket, :status => '')
    assert !ticket.valid?, 'The ticket should be valid because it doesnt  have a status'
    ticket.status = 'Open'
    assert ticket.valid?, 'the ticket should be valid now that it has a status'
  end
  
  test "test that the user is stored properly" do
    user = Factory.build(:user, :first_name => 'Brent', :last_name => 'Montague')
    ticket = Factory.build(:ticket, :submitter => user)
    assert_equal ticket.submitter.full_name, 'Brent Montague'
  end
  
end