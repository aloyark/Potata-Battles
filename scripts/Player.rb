class Player

	def initialize(x,y)
		@real_x = x
		@real_y = y
		@stand_right = Image.new($window, "graphics/sprites/player_right.png", false)
		@stand_left = Image.new($window, "graphics/sprites/player_left.png", false)
		@rapier = Image.new($window, "graphics/Rapier.png", false)
		@back = Image.new($window, "graphics/Back.png")
		@sprite = @stand_right
		@dir = :right
		@x = @real_x + (@sprite.width / 2)
		@y = @real_y + @sprite.height
		
		@speed = 15
		@move_x = 0
		@moving = false
		@jump = 0
		
		@SwingSpeed = 50
		@SwordInc = true
		@SwordRot = 0
		@Swing = false
		@frame = 0
	end

	def update
		@real_x = @x - (@sprite.width / 2)
		@real_y = @y - @sprite.height
		
		#Boarder
		if @x <= 10
			@x = 10
		elsif @x >= 630
			@x = 630
		end
		#/Boader

		if @moving then
			if @move_x > 0 then
				@move_x -= 1
				@x += @speed
			elsif @move_x < 0 then
				@move_x += 1
				@x -= @speed
			elsif @move_x == 0 then
				@moving = false
			end
		else
			case @dir
			
			when :left
				@sprite = @stand_left
			when :right
				@sprite = @stand_right
			end
		end

		if @jump > 0 then
			@y -= 8
			if @dir == :left then
				@sprite = @stand_left
			elsif @dir == :right then
				@sprite = @stand_right
			end
			@jump -= 1
		end
		
		#Swing
		if @Swing 
			if @SwordRot <= -90 
				@SwordInc = false
			elsif @SwordRot >= 0 
				@SwordInc = true
			end
		elsif !@Swing
			if @SwordRot < 0
				@SwordRot += @SwingSpeed / 2
			end
		end
		
		if @SwordInc && @Swing
			@SwordRot -= @SwingSpeed
		elsif !@SwordInc && @Swing
			@SwordRot += @SwingSpeed
		end
		
		
		#/Swing
	
	end
	
	#Movement funtions
	def fall
		if @jump == 0 then
			@y += 2
			if @dir == :left then
				@sprite = @stand_left
			elsif @dir == :right then
				@sprite = @stand_right
			end
		end
	end

	def jump
		@jump = 15 if @jump == 0
	end

	def move_left
		@dir = :left
		@move_x = -3
		@sprite = @stand_left if @jump == 0
		@moving = true
	end

	def move_right
		@dir = :right
		@move_x = 3
		@sprite = @stand_right if @jump == 0
		@moving = true
	end
	#/Movement funtions
	
	#Getters
	def get_x
		return @x
	end

	def get_y
		return @y
	end

	def get_swing_true
		@Swing = true
		return @Swing
	end
	
	def get_swing_false
		@Swing = false
		return @Swing
	end
	#/Getters

	def draw(z=5)
		@back.draw(0, 0, 0)
		@sprite.draw(@real_x, @real_y, z, 1)
		
		if(@dir == :left)
			@rapier.draw_rot(@real_x, @real_y, 10, @SwordRot, 0.5, 0.9, 1, 1)
		elsif(@dir == :right)
			@rapier.draw_rot(@real_x + 30, @real_y, 10, -@SwordRot, 0.5, 0.9, 1, 1)
		end
	end

end