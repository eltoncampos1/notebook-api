class ContactsController < ApplicationController
  before_action :set_contact, only: %i[ show update destroy ]

  # GET /contacts
  def index
    @contacts = Contact.all

    render json: @contacts 
  end

  # GET /contacts/1
  def show
    render json: @contact, include: [:kind, :address, :phones]
  end

  # POST /contacts
  def create
    @contact = contact.new(contact_params)

    if @contact.save
      render json: @contact, include: [:kind, :phones, :address], status: :created, location: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # patch/put /contacts/1
  def update
    if @contact.update(contact_params)
      render json: @contact, include: [:kind, :phones, :address]
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # delete /contacts/1
  def destroy
    @contact.destroy!
  end

  private
    # use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
end
