class User < ApplicationRecord

	validates :name,
	presence: true,
	length: { minimum: 3, maxmum: 16 }


	#has_secure_password
	validates :password,
	presence: true,
	length: { minimum: 3 }

end
