class AdminsController < ActionController::Base
  protect_from_forgery with: :exception
  #before_action :authenticate_admin_user!
  before_action :set_resource, except: [:index, :create, :new]
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  layout "admin"

  def index
    resources = base_index_query
                .where(query_params)
                .search(params[:q])
                .order(order_args)
    instance_variable_set(plural_resource_variable, resources)
  end

  def new
    resource = resource_class.new()
    instance_variable_set(resource_variable, resource)
  end

  def edit
    resource ||= resource_class.find(params[:id])
  end

  def create
    resource = set_resource(resource_class.new(resource_params))
    begin
      get_resource.save ? successfully_saved : render(:new)
    rescue => e
      get_resource.errors[:base] << (e.to_s)
      render :new
    end
  end

  def show
  end

  def destroy
    begin
      get_resource.destroy ? successfully_deleted : ""
    rescue => e
      get_resource.errors[:base] << (e.to_s)
      unsuccessfully_deleted
    end
  end


  def update
    resource ||= resource_class.find(params[:id])
    begin
      get_resource.update(resource_params) ? successfully_saved : render(:edit)
    rescue => e
      get_resource.errors[:base] << (e.to_s)
      render :edit
    end
  end

  private

  def successfully_saved
    flash[:success] = "#{resource_name} is saved"
    redirect_to "/#{resource_name.pluralize}"
  end

  def successfully_deleted
    flash[:success] = "#{resource_name} is deleted"
    redirect_to "/#{resource_name.pluralize}"
  end

  def unsuccessfully_deleted
    flash[:error] = "You can't delete the #{resource_name} : #{ get_resource.errors[:base]}"
    redirect_to "/#{resource_name.pluralize}"
  end

  def not_found
    render json: {message: 'Not found'}, status: :not_found
  end

  def model_attributes
    resource_class.attribute_names.map{|s| s.to_sym}
  end

  def resource_params
    @resource_params ||= self.send("#{resource_name}_params")
  end

  def set_resource(resource = nil)
    resource ||= resource_class.find(params[:id])
    instance_variable_set("@#{resource_name}", resource)
  end

  def get_resource
   instance_variable_get("@#{resource_name}")
  end

  def resource_name
   @resource_name ||= self.controller_name.singularize
  end

  def resource_class
   @resource_class ||= resource_name.classify.constantize
  end

  def base_index_query
    resource_class
  end

  def render_multiple
    resources = instance_variable_get(plural_resource_variable)
   end

  def query_params
    {}
  end

  def page_params
    params.permit(:page, :page_size, :q, :commit, :utf8)
  end

  def order_args
    'created_at DESC'
  end


  def plural_resource_variable
    "@#{resource_name.pluralize}"
  end

  def resource_variable
    "@#{resource_name}"
  end
end
