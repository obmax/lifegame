class Life
  def initialize
    @changes=0
    @ar=Array.new(30).map!{Array.new(30,0)}
    @ar[15][16]=1
    @ar[15][14]=1
    @ar[16][15]=1
    @ar[14][14]=1
    @ar[14][15]=1
    @ar[14][16]=1
    @ar[13][15]=1
  end

  def out
    @ar.each do |i|
      i.each do |j|
        print "#{j}"
      end
      puts ""
    end
  end

  def evolve
    @changes=0
    b=Array.new(30).map!{Array.new(30,0)}
    @ar.each_with_index do |el,i|
      if i!=0 and i!=29
        el.each_with_index do |el1,j|
          if j!=0 and j!=29
            sum=@ar[i][j-1]+@ar[i][j+1]+@ar[i-1][j-1..j+1].sum+@ar[i+1][j-1..j+1].sum
            case el1
              when 0 then
                if sum==3
                  b[i][j]=1 and @changes+=1 
                else 
                  b[i][j]=0
                end
              when 1 then
                if sum>3 or sum<2
                  b[i][j]=0 and @changes+=1 
                else
                  b[i][j]=1
                end
            end
          end
        end
      end
    end
    @ar=b
  end

  def check
    amount=0
    @ar.each{|i| amount+=i.count(1)}
    if amount==0 or @changes==0
      false
    else
      true
    end
  end

  def run
    while check
      sleep 0.5
      evolve
      out
      puts "----------------"
    end
    puts "its over"
  end
end


#---------------------

life=Life.new
life.out
puts "----------------"
life.evolve
life.out
life.run
