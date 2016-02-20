# == Schema Information
#
# Table name: members
#
#  id                     :integer          not null, primary key
#  first_name             :string           not null
#  last_name              :string           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#

class MembersController < ApplicationController
  def edit
    # All the setup that is needed to build the edit page view
    @member = Member.find(params[:id])
    @contactInfo = MemberContact.find_or_initialize_by(member_id: params[:id])
    # byebug
    @contactInfo[:email] = current_member.email
    @member.member_contacts.build(@contactInfo.attributes)
  end

  def update
    # Create org_ca to sanitize our hash to proper "contacts" attributes
    @org_ca = update_member_params["member_contacts_attributes"]["0"]
    @org_ca[:typ_country_id] = @org_ca.delete :typ_countries
    @org_ca[:typ_country_id] = @org_ca[:typ_country_id][:id]
    @org_ca[:typ_region_id] = @org_ca.delete :typ_regions
    @org_ca[:typ_region_id] = @org_ca[:typ_region_id][:id]
    # @org_ca[:org_company_id] = @org_ca.delete :org_company
    # @org_ca[:org_company_id] = @org_ca[:org_company_id][:id]

    # Edit function variables, in case of failed validations and we re-render :edit
    @member = Member.find_by(id: current_member.id) #Find the OrgPerson corresponding to org_person_id FK
    # Using the org_person_id find/create the record and assing the attributes to @contactInfo
    @contactInfo = MemberContact.find_or_initialize_by(member_id: current_member.id).attributes
    # byebug
    @contactInfo[:email] = current_member.email
    @member.member_contacts.build(@contactInfo) #Build the form using @contactInfo
    # if !@org_ca[:org_company_id].nil?
    #   OrgPerson.update(current_org_person.id ,org_company_id: @org_ca[:org_company_id])
    # end
    # byebug
    # Find contacts record or create them if necessary
    @contact = MemberContact.find_or_create_by(member_id: current_member.id)

    # Try to save it, if it saves, then redirect to the edit page with success
    if @contact.update_attributes(@org_ca)
      # If this user also controls the information of the company (i.e. COO) then also update company email
      MemberContact.where(email: current_member.email).update_all(email: @org_ca["email"])
      # If there is a company, update the person record to reflect the company too.
      flash[:success] = "Profile updated"
      redirect_to edit_member_path(@member.id)
    else # Failed. Re-render the page as unsucessful
      render :edit
    end
  end

  private

  def update_member_params
    params.require(:member).permit(member_contacts_attributes: [:address1, {typ_countries: :id}, {typ_regions: :id}, :postal_code, :email, :cell_number, :member_id, :avatar])
  end
end
