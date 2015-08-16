class PinsController < ApplicationController
	before_action :find_pin, only: [:show, :edit, :update, :destroy]

#Method for oredering pins by decending order.
def index
  @pins = Pin.all.order("created_at DESC")
end

#Method for building a new Pin.
def new

	@pin = current_user.pins.build

end

#Method for creating a new Pin.
def create

	@pin = current_user.pins.build(pin_params)

	if @pin.save
		redirect_to @pin, notice: "Succesfully created your pin!"
	else
		render 'new'
	end
end

#Method that calls the (views/edit.html.haml) file.
 def edit

end

#Method for updating a Pin.
def update

  if @pin.update(pin_params)
    redirect_to @pin, notice: "Your Pin was succesfully updated!"

  else
    render 'edit'
  end
end

#Method for deleting a Pin.
def destroy

  @pin.destroy
  redirect_to root_path

end

#Method that shows the pin ie(views/pins/show.html.haml)
def show


end

private

#Allows the title and description through.
def pin_params

	params.require(:pin).permit(:title, :description)

end

	def find_pin

		@pin = Pin.find(params[:id])

	end

end
