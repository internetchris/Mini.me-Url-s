
# Mini.me URL's in Sinatra
#
require 'rubygems'
require 'sinatra'
require 'sequel'
require 'active_record'

 
## Setup

ActiveRecord::Base.establish_connection(
  :adapter  => "mysql",
  :host     => "localhost",
  :username => "root",
  :password => "",
  :database => "mini_url"
)
 

# Models

class Iteration < ActiveRecord::Base
end


class MiniMeUrls < ActiveRecord::Base
  
end

get '/' do
  # Form for entering a long URL
  <<-end_form
  <h1>Mini.me URLs!</h1>
  <form method='post'>
    <input type="text" name="url">
    <input type="submit" value="Mini.me It!">
  </form>
  end_form
end

post '/' do
  # Save the long URL
  get_code = Iteration.find(:first)

  @a_value = get_code[:a]
  @b_value = get_code[:b]
  @c_value = get_code[:c]
  @d_value = get_code[:d]

#### Set the A Value #####

  if @b_value == 61
    if @a < 61
    @a = @a_value +1
    else
      @a = 61
      end
  end

#### Set the B Value #####

  if @c_value == 61
    if @b < 61
    @b = @b_value +1
    else
    @b = 61
      end
  end
#### Set the C Value #####


  if @d_value == 61
  if @c < 61
    @c = @c_value +1
  else
    @c = 61
  end
  end

#### Set the D Value #####

  if @d_value < 61
    @d = @d_value + 1
  else
    @d = 61
  end




  chars = ["o", "8", "T", "I", "D", "J", "Z", "p", "9", "n", "s", "b", "C", "E", "N", "x", "v", "P", "z", "c", "3", "R", "g", "O", "1", "j", "Y", "W", "K", "w", "A", "M", "t", "i", "B", "S", "U", "Q", "6", "u", "0", "X", "L", "4", "G", "F", "V", "m", "H", "r", "e", "k", "l", "d", "q", "h", "2", "7", "a", "5", "y", "f"]

 @a = @a.to_i
  @b = @b.to_i
  @c = @c.to_i
  @d = @d.to_i



@a.upto(@a) do |c1|
  @b.upto(@b) do |c2|
    @c.upto(@c) do |c3|
      @d.upto(@d) do |c4|
@mcreate = MiniMeUrls.create(:mini_key => [chars[c1], chars[c2], chars[c3], chars[c4]].join, :url => params[:url])
@icreate = Iteration.update(1,{:a => @a, :b => @b, :c =>@c, :d => @d})
      end
    end
  end
end

  mini_url = @mcreate.mini_key
  url = request.url + mini_url.to_s
  "Your Mini.me URL is: <a href='#{url}'>#{url}</a>"
   
end

get '/:mini_id' do
  # Redirect the Mini.me url

  url_rec = MiniMeUrls.find_by_mini_key(params[:mini_id])
  redirect "#{url_rec.url}", 301
end