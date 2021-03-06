class AffiliatesController < ApplicationController
  load_and_authorize_resource
  
  def new
    @page_title = "Affiliate Sign Up"
    @affiliate = Affiliate.new
    build_nested_attributes @affiliate
  end
  
  def edit
    @affiliate = Affiliate.find params[:id]    
    @page_title = "Editing Affiliate " + @affiliate.company_name
    build_nested_attributes @affiliate
  end
  
  def create
    @affiliate = Affiliate.new params[:affiliate]
    
    if @affiliate.save
      redirect_to root_url, :notice => "You have successfully signed up."
    else
      build_nested_attributes @affiliate
      render 'new'
    end
  end
  
  def update
    @affiliate = Affiliate.find params[:id]
    if @affiliate.update_attributes params[:affiliate]
      redirect_to root_url, :notice => "You have updated your account information successfully."
    else
      build_nested_attributes @affiliate
      render 'edit'
    end    
  end
  
  def accept
    @affiliate = Affiliate.find params[:id]
    if @affiliate.accept
      redirect_to admin_dashboard_path, :notice => "Affiliate updated successfully."
    else
      redirect_to admin_dashboard_path, :alert => "We couldn't update this affiliate."
    end
  end
  
private
  def build_nested_attributes affiliate
    affiliate.addresses.build      if affiliate.addresses.blank?
    affiliate.certifications.build if affiliate.certifications.blank?    
    affiliate.service_sets.build   if affiliate.service_sets.blank?
    affiliate.skill_sets.build     if affiliate.skill_sets.blank?
    
    phones = []
    ph_types = @affiliate.phones.map(&:ph_type)
    ["Mobile", "Fax", "Landline"].each_with_index { |type|
      if ph_types.include? type
        phones << @affiliate.phones[ph_types.index(type)]
      else
        phones << @affiliate.phones.build(:ph_type => type)
      end          
    }        
    @affiliate.phones = phones
  end
end
