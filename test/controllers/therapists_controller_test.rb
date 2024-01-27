require 'test_helper'

class TherapistsControllerTest < ActionDispatch::IntegrationTest
  def setup
    create_test_data
  end

  test "should get index with filtering" do
    # Perform a GET request to therapists index with filter parameters
    get therapists_path, params: { insurance: 'Aetna', remote: true, location: 'Brooklyn' }

    # Check for successful response
    assert_response :success

    # Check if filtered therapists are displayed in the HTML response
    assert_select 'td', text: 'John Doe'
    assert_select 'td', text: 'Aetna'
    assert_select 'td', text: 'Yes'
    assert_select 'td', text: 'Brooklyn'

    # Check that other therapists are not present in the HTML response
    assert_select 'td', text: 'Jane Smith', count: 0
    assert_select 'td', text: 'Blue Cross Blue Shield', count: 0
    assert_select 'td', text: 'No', count: 0
    assert_select 'td', text: 'Manhattan', count: 0
  end

  private

  def create_test_data
    Therapist.create(name: 'John Doe', insurance: 'Aetna', remote: true, location: 'Brooklyn')
    Therapist.create(name: 'Jane Smith', insurance: 'Blue Cross Blue Shield', remote: false, location: 'Manhattan')
  end
end
