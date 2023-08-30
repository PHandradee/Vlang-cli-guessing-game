module main

import os { input }
import rand {u32n}

fn get_guess_input() !i64 {
	guess_try_str := input('Input your guess: ').trim_space()

	if guess_try_str.is_blank() {
		return error('Need to specify a number!')
	}

	guess_try_int := guess_try_str.parse_int(0, 32) or {
		return error('Need to specify a number, not a text!')
	}

	if guess_try_int > 100 || guess_try_int < 0 {
		return error('Need to be a number between 0 and 100, Try again')
	}

	return guess_try_int
}

fn main() {
	println('Guess the number game!!')
	println('-----------------------')

	secret_number := rand.u32n(100)!

	for {
		mut guess := get_guess_input() or {
			println(err)
			continue
		}

		// println(typeof(guess).name)
		println('You guessed: ${guess}')
		println('-----------------------')

		match true {
			guess < secret_number {
				println('Too small! Try Again. ')
				println('-----------------------')
			}
			guess > secret_number {
				println('Too big! Try Again. ')
				println('-----------------------')
			}
			else {
				println('Correct! You win!')
				break
			}
		}
	}
}
