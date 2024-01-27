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

  test "should get index without filtering" do
    # Perform a GET request to therapists index without filter parameters
    get therapists_path

    # Check for successful response
    assert_response :success

    # Check if all therapists are displayed in the HTML response
    assert_select 'td', text: 'John Doe'
    assert_select 'td', text: 'Jane Smith'
    assert_select 'td', text: 'Aetna'
    assert_select 'td', text: 'Blue Cross Blue Shield'
    assert_select 'td', text: 'Yes'
    assert_select 'td', text: 'No'
    assert_select 'td', text: 'Brooklyn'
    assert_select 'td', text: 'Manhattan'
  end

  test "should get index with invalid insurance" do
    # Perform a GET request to therapists index with an invalid insurance
    get therapists_path, params: { insurance: 'Invalid Insurance' }

    # Check for successful response
    assert_response :success

    # Check if no therapists are displayed in the HTML response
    assert_select 'td.location', count: 0
  end

  private

  def create_test_data
    Therapist.create(name: 'John Doe', insurance: 'Aetna', remote: true, location: 'Brooklyn')
    Therapist.create(name: 'Jane Smith', insurance: 'Blue Cross Blue Shield', remote: false, location: 'Manhattan')
  end
end
