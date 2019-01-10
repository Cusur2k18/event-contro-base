require 'test_helper'

class EventTest < ActiveSupport::TestCase

  def before_setup
    super
    @event = Event.new(
      name: 'Testinsg', 
      career: 'Resdes', 
      description: 'Loremp ipsum', 
      location: 'City', 
      start_date: '2018-12-06 20:42:43', 
      end_date: '2018-12-06 20:42:43')
  end

  # Validations
  it 'Not save if any of the required fields are missing' do
    test 'Event: should not save if not name' do
      @event.name = nil
      assert_not @event.save, 'Event saved whitout name'
    end

    test 'Event: should not save if not career' do
      @event.career = nil
      assert_not @event.save, 'Event saved whitout career'
    end

    test 'Event: should not save if not description' do
      @event.description = nil
      assert_not @event.save, 'Event saved whitout description'
    end

    test 'Event: should not save if not location' do
      @event.location = nil
      assert_not @event.save, 'Event saved whitout location'
    end

    test 'Event: should not save if not start_date' do
      @event.start_date = nil
      assert_not @event.save, 'Event saved whitout start_date'
    end

    test 'Event: should not save if not end_date' do
      @event.end_date = nil
      assert_not @event.save, 'Event saved whitout end_date'
    end

  end

  
  # should "recommend 2 highest ranked, in stock movies unwatched by user" do
  #   user    = Factory(:user)
  #   top_out = Factory(:movie, :ranking => 100, :in_stock => false)
  #   top_in  = Factory(:movie, :ranking => 95,  :in_stock => true)
  #   next_in = Factory(:movie, :ranking => 90,  :in_stock => true)
  #   watched = Factory(:movie, :ranking => 100, :in_stock => true)
  #   Factory(:viewing, :user => user, :movie => watched)

  #   assert_equal [top_in, next_in], Movie.recommended_for(user, 2)
  # end
end
