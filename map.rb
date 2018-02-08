module Map 



  class Room
    def initialize(name, description)
      @name = name
      @description = description
      @paths = {}
    end
    
    attr_reader :name
    attr_reader :paths
    attr_reader :description
  
    def go(direction)
      return @paths[direction]
    end
                                                     
    def add_paths(paths)
      @paths.update(paths)
    end
    
    # def read(x)
    #   @text = [ ]
    #   File.readlines(x).each do |line|
    #       text.push("\n #{line}")
    #   end
    #   return @text
    # end

  end
  

  CELL = Room.new("Cell",
    """
    You have been imprisoned for a year now. But all that is about to change.
  The prison book cart comes around. You ask May I have the Count of Monte Cristo, 
  please? The librarian nods, and hands you the book. As the librarian wheels the
  cart away, you smille. You open the book. As you expected, the pages
  have been cut and there is a metal file in their place. Only one decision remains,
  will you file the bars on your *window* or *door*?
    
    Enter below:
    """)

  HALL = Room.new("Hall",
    """
    You file the bars enough to slide through into the hallway. To your left there 
    is a staircase which leads to the *roof*, which is thirty stories up.
    To the right, there is a *hall* leading to the main gates of the prison.
    However, there may be more gaurds that way.

    Enter below:
    """)
    
  YARD = Room.new("Yard",
    """
    You file down the bars on your window, making a hole just big enough to squeze
    through. You find yourself in the yard. A guard about ten feet away sees you. 
    He hollers and draws his weapon. With nowhere to hide you can either *rush* 
    him or *run* away.
    
    Enter below:
    """)  
    
  GAURD = Room.new("gaurd",
    """
      You go to the right, down the hall. Sure enough, you hear radio chatter around
    the corner -- the walkie-talkie of the guard. You panic, flight or flight kicks
    in. You can either *rush* the guard or *hide* in the room just to your right.

    Enter below:
    """)
    
  GUARD_FAIL = Room.new("guard_fail",
    """
    You rush the gaurd and run forward to tackle him. He hears your heavy footsteps
    and pulls out his bully club. He takes a swing at you. The gaurd swings the club 
    aross his body at your head, but you are able to duck in time. 
    You land a quick, hard jab to the guard's torso. He reels back from 
    the punch. He composes himself and raises his club above his head to for another 
    blow. You tackle him.His club is still above his head. However, the
    guard has quick reflexes and is able to sprawl, staying on his feet. 
    You decide to go for his gun on his hip.You swiftly grab the guard's gun.
    You step back and point the gun right at the
    guard's head. He puts his hands up, but smiles at something behind you. 
    You turn your head to look and find five guards, rifles pointed at you. They must
    have heard the clamber of the fight over the guard's walkie talkie. There's
    no way out.

    you lose
    
    """)   
    
  ARMORY = Room.new("Armory",
    """
    You hide from the guard, going into the room on your right, pushing the 
    already slightly open large metal door. You put your back to the wall, close
    your eyes, and hold your breath. After you hear the guard pass, you open your
    eyes and smile -- you are in the Armory. There is a rifle and a full set of riot
    gear at your feet. You load the rifle and put on the gear. You run-and-gun your 
    way to the front of the prison. There are two escape vechiles, a *motorcycle* 
    and a *truck*.

    Enter below:
    """)
    
  MOTORCYCLE = Room.new("Motorcycle",
    """
    You get on the motorcycle. You smile to find the keys in the ignition. You twist
    the throtle and the motorcycle reves to life. A rifle cracks, and you are thown
    by the impact of the bullet as it hits your kevlar vest. You stay on the 
    motorcycle, and go full speed ahead at the chain link fence hoping to burst through. 
    However, you dont build enough speed and just kinda bounce off the fence. The
    guards have ample time to take you into custody.

    you lose

    """)
    
  TRUCK = Room.new("Truck",
    """
    You climb into the truck. There are no keys, you are going to have to hotwire it.
    You break open the panel under the stearing wheel and find a mess of wires, all 
    different collors: *red*, *blue*, *green*, *yellow*, *orange*.
    You have no idea what you are doing, and decide to guess

    (pick two colors of the wires to join together)
    (please answer in the form of <color> and <color>)

    Enter below:
    """)

  TRUCK_WIN = Room.new("Truck_win",
    """
   You connect the wires. In a stroke of incredible luck, the engine roars to life.
    You put pedal to metal and slam through the chain link fence, escaping the
    prison.

  You win.
    """)
    
  TRUCK_LOSE = Room.new("Truck_lose",
    """
    You connect the wires. Nothing happens. Then someting breaks the window and lands
  square in your lap. You realize it is an active grenade. 

  you lose.
    """)
    
  RUN_1 = Room.new("Run_1",
    """
    You run away from the guard. Thankfully for you, he has Stormtrooper aim. 
    He chases after you -- yelling. The floodlights come on, and alarms come on. 
    Guards flock to the watchtowers at the edges of the yard. You get the the end 
    of the yard, bullets wizzing by. You can either try to climb the *fence* or you
    can jump into the *sewer* pipes that line the yard.

    Enter below:
    """)
  
  SEWER = Room.new("Sewer",
    """
    Thinking you will be too exposed on the fence, you jump into the sewer pipe to 
    escape the bullets. You remember that sence from Shawshank and decide to crawl 
    through the nastyness rather than face your captors. After an eternity of crawling
    through unspeakable foulness, you reach a stream that the pipe lets out into.

    you win
    """)  
  
  FENCE = Room.new("Fence",
    """
    You try to climb the fence. Unfortunatly, you cand climb fast enough, and become
    a stationary target for the guards in the watchtowers. There is a rifle crack and
    then nothing but darkness.
  
    you lose
    """)  


  RUN_2 = Room.new("Run_2",
    """
    You run at the gaurd. you grab the gun out of his hand and pistol whip him.
    You have beaten the guard in the fight, but just then, there is a rifle
    crack from the watchtower and a bullet lands at your feet. You run as fast as
    posible, to the end of the yard, where there is a *sewer* pipe and a chain 
    link *fence*.
    Enter below:
    """)
    
  ROOF = Room.new("Roof",
    """
    You make a left and climb the 30 flights of stairs. At the top of the stairwell
    there is a locked metal door leading to the roof. Fortunetly the hinges are 
    rusted. One swift kick breaks the door down. However, you realize that you have 
    just made a very loud noise, and that guards are probably on the way. Paniced,
    you look around. You see a *parachute*. Or you could try and *climb* down the 
    side of the prison. 

    Enter below:
    """)
  
  
  PARACHUTE = Room.new("Parachute",
    """
    You put on the Parachute, and jump off the side of the prison right when the 
    guards arrive. You pull your rip cord. Nothing happens. You realize to late that
    this is actually just a backpack. Just before you hit the ground, you think,
    Oh yeah, why would there be a parachute on top of a prison roof. That makes no
    sense.

    SPLAT

    you die (and also lose)
    """)  
    
  CLIMB = Room.new("Climb",
    """
    You decide to climb down the side of the prison walls. However, you quickly
    realize that climbing down a sheer drop of a wall is near impossible. You try
    to use the bars of the prison windows as handholds. You make the mistake of 
    looking down. Your grips slips and you fall 27 stories. 

    Splat

    you die (and also lose)
    """)
    
  CELL.add_paths({
    'window' => YARD,
    'door' => HALL,
  })  
  
  HALL.add_paths({
    'hall' => GAURD,
    'roof' => ROOF,
  })
  
  YARD.add_paths({
    'run' => RUN_1,
    'rush' => RUN_2,
  }) 
  
  RUN_1.add_paths({
    'fence' => FENCE,
    'sewer' => SEWER,
  }) 
  
  RUN_2.add_paths({
    'fence' => FENCE,
    'sewer' => SEWER,
  }) 
  
  ROOF.add_paths({
    'parachute' => PARACHUTE,
    'climb' => CLIMB,
  })  
  
  ARMORY.add_paths({
    'motorcycle' => MOTORCYCLE,
    'truck' => TRUCK,
  })
  
  GAURD.add_paths({
    'rush' => GUARD_FAIL,
    'hide' => ARMORY,
  }) 
  
  TRUCK.add_paths({
    'red and blue' => TRUCK_WIN,
    'blue and red' => TRUCK_WIN,
    '*' => TRUCK_LOSE,
  }) 
  
 
  START = CELL

  ROOM_NAMES = {
    'HALL' => HALL,
    'YARD' => YARD,
    'ARMORY' => ARMORY,
    'TRUCK' => TRUCK,
    'GAURD' => GAURD,
    'RUN_1' => RUN_1,
    'RUN_2' => RUN_2,
    'ROOF' => ROOF,
    'SEWER' => SEWER,
    'FENCE' => FENCE,
    'PARACHUTE' => PARACHUTE,
    'TRUCK_LOSE' => TRUCK_LOSE,
    'TRUCK_WIN' => TRUCK_WIN,
    'MOTORCYCLE' => MOTORCYCLE,
    'GUARD_FAIL' => GUARD_FAIL,
    'START' => START,
  }
    
    

  def Map::load_room(session)
    return ROOM_NAMES[session[:room]]
  end

  def Map::save_room(session, room)
    session[:room] = ROOM_NAMES.key(room)
  end

end