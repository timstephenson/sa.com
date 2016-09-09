# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Instructors" do
    describe "Admin" do
      describe "instructors", type: :feature do
        refinery_login

        describe "instructors list" do
          before do
            FactoryGirl.create(:instructor, :full_name => "UniqueTitleOne")
            FactoryGirl.create(:instructor, :full_name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.instructors_admin_instructors_path
            expect(page).to have_content("UniqueTitleOne")
            expect(page).to have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.instructors_admin_instructors_path

            click_link "Add New Instructor"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Full Name", :with => "This is a test of the first string field"
              expect { click_button "Save" }.to change(Refinery::Instructors::Instructor, :count).from(0).to(1)

              expect(page).to have_content("'This is a test of the first string field' was successfully added.")
            end
          end

          context "invalid data" do
            it "should fail" do
              expect { click_button "Save" }.not_to change(Refinery::Instructors::Instructor, :count)

              expect(page).to have_content("Full Name can't be blank")
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:instructor, :full_name => "UniqueTitle") }

            it "should fail" do
              visit refinery.instructors_admin_instructors_path

              click_link "Add New Instructor"

              fill_in "Full Name", :with => "UniqueTitle"
              expect { click_button "Save" }.not_to change(Refinery::Instructors::Instructor, :count)

              expect(page).to have_content("There were problems")
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:instructor, :full_name => "A full_name") }

          it "should succeed" do
            visit refinery.instructors_admin_instructors_path

            within ".actions" do
              click_link "Edit this instructor"
            end

            fill_in "Full Name", :with => "A different full_name"
            click_button "Save"

            expect(page).to have_content("'A different full_name' was successfully updated.")
            expect(page).not_to have_content("A full_name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:instructor, :full_name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.instructors_admin_instructors_path

            click_link "Remove this instructor forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::Instructors::Instructor.count).to eq(0)
          end
        end

      end
    end
  end
end
