class SceneMap

	def initialize
		@player = Player.new(320,240)
	end

	def update
		@player.update
		@player.move_left if $window.button_down? char_to_button_id("a")
		@player.move_right if $window.button_down? char_to_button_id("d")
		@player.fall if no_ground?(@player.get_x, @player.get_y)
		
		if $window.button_down? char_to_button_id(" ")
			if !no_ground?(@player.get_x, @player.get_y) then
				@player.jump
			end
		end
		
		if $window.button_down?(MsLeft)
			@player.get_swing_true
		elsif !$window.button_down?(MsLeft)
			@player.get_swing_false
		end
	end

	def no_ground?(x,y)
		return y < 480
	end

	def draw
		@player.draw
	end

	def button_down(id)
		if id == KbNumpad0
			close
		end
	end

	def button_up(id)

	end

end
