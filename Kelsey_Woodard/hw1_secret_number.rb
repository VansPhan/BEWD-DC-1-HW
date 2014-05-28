# STEP 1 - welcome player & get name


puts "Welcome to the Secret Number Game! This game was created by K-Dub."
puts "What's your name?"
player_name = gets.chomp.upcase
puts "Hi #{player_name}!"
puts "Let's quickly go over the rules. You must guess a number between 1 and 10."
puts "You'll have 3 tries to guess the correct number. Simple enough, right?" 
puts "Ok, let's give it a go."

secret_number = rand(11) # This will produce a random number between 0 and 10, how can
                         # you change to make it between 1 and 10?

def guess(secret_number)
	3.downto(1) do |num|

		puts "Guess a number between 1 and 10."
		guesses_left = num 
		if guesses_left == 1
			puts "You have #{guesses_left} guess left. Make it a good one." #nice!
		elsif # Where's the condition?
			puts "You have #{guesses_left} guesses left."
		end

		guess = gets.to_i
		guesses_left = num - 1

		while guess < 1 || guess > 10 #good
			puts "Please guess a valid number between 1 and 10."
			guess = gets.to_i
		end
		
		if guess == secret_number
			puts "Congratulations! #{guess} is the secret number! You win!!!"
			abort # this works, but abort immediately stops the program. Instead,
			      # you can just break out of the loop with break
		end

		if guesses_left == 0
			puts "Sorry, game over! The secret number was #{secret_number}."
			abort
		end

		if guesses_left > 0 
			puts "Good try, but guess a little higher." if guess < secret_number # this is cool!
			puts "Good try, but guess a little lower." if guess > secret_number
			end
		end

	end


guess(secret_number)