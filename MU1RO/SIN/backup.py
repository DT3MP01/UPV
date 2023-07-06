
import pyhop



def get_elevator(state,etype):  # evaluation function
    for elevator in state.elevators[etype].keys():
        if(state.elevators[etype][elevator]['capacity']>0):
            return elevator
    return False

def call_elevator(state, etype, elevator,p):
    p_loc = state.passengers[p]
    #El elevador tiene que tener capacidad suficiente
    if state.elevators[etype][elevator]['capacity']>=1:
        state.elevators[etype][elevator]['floor']=p_loc
        return state
    else:
        return False

def enter_elevator(state, etype, elevator,p):
    p_loc = state.passengers[p]
    #El acensor está en el piso donde se encuentra la persona
    if p_loc == state.elevators[etype][elevator]['floor']:
        state.passengers[p]=elevator
        state.elevators[etype][elevator]['capacity']-=1
        return state
    else:
        return False

def move_elevator(state, etype, elevator,floor,p):
    p_loc = state.passengers[p]
    #La persona debe estar dentro del elevador
    if p_loc == elevator:
        state.elevators[etype][elevator]['floor']=floor
        return state
    else:
        return False

def leave_elevator(state, etype, elevator,p):
    p_loc = state.passengers[p]
    #La persona debe estar dentro del elevador
    if p_loc == elevator:
        state.passengers[p]=state.elevators[etype][elevator]['floor']
        state.elevators[etype][elevator]['capacity']-=1
        return state
    else:
        return False


pyhop.declare_operators(call_elevator, enter_elevator, move_elevator, leave_elevator)
print()
pyhop.print_operators()



def pair_elevator(state, goal,p):
    p_loc = state.passengers[p]
    g_dest = goal.passengers[p]
    etype='fast'
    elevator='f1'
    if (p_loc % 2 == 0 and g_dest % 2 == 0):
        return [('call_elevator', etype, elevator,p),('enter_elevator', etype, elevator,p),
                ('move_elevator', etype, elevator,g_dest,p),('leave_elevator', etype, elevator,p)]
    return False

def impair_elevator(state, goal,p):
    p_loc = state.passengers[p]
    g_dest = goal.passengers[p]
    etype='fast'
    elevator='f2'
    if (p_loc % 2 != 0 and g_dest % 2 != 0):
        return [('call_elevator', etype, elevator,p),('enter_elevator',etype, elevator,p),
                ('move_elevator', etype, elevator,g_dest,p),('leave_elevator', etype, elevator,p)]
    return False

def block1_elevator(state, goal,p):
    p_loc = state.passengers[p]
    g_dest = goal.passengers[p]
    etype = 'b1'
    elevator=get_elevator(state, etype)
    # Está dentro del bloque X y  Existe un elevador lento en ese bloque
    if abs(p_loc-g_dest) <= 4 and elevator != False:
        return [('call_elevator', etype, elevator,p),('enter_elevator', etype, elevator,p),
                ('move_elevator', etype, elevator,g_dest,p),('leave_elevator', etype, elevator,p)]
    return False

def block2_elevator(state, goal,p):
    p_loc = state.passengers[p]
    g_dest = goal.passengers[p]
    etype = 'b2'
    elevator=get_elevator(state, etype)
    # Está dentro del bloque X y  Existe un elevador lento en ese bloque
    if abs(p_loc-g_dest) <= 4 and elevator != False:
        return [('call_elevator', etype, elevator,p),('enter_elevator', etype, elevator,p),
                ('move_elevator', etype, elevator,g_dest,p),('leave_elevator', etype, elevator,p)]
    return False

def block3_elevator(state, goal,p):
    p_loc = state.passengers[p]
    g_dest = goal.passengers[p]
    etype = 'b3'
    elevator=get_elevator(state, etype)
    # Está dentro del bloque X y  Existe un elevador lento en ese bloque
    if abs(p_loc-g_dest) <= 4 and elevator != False:
        return [('call_elevator', etype, elevator,p),('enter_elevator', etype, elevator,p),
                ('move_elevator', etype, elevator,g_dest,p),('leave_elevator', etype, elevator,p)]
    return False
pyhop.declare_methods('direct_path',pair_elevator,impair_elevator,block1_elevator,block2_elevator,block3_elevator)


def up_one_floor(state, goal,p):
    p_loc = state.passengers[p]
    g_dest = goal.passengers[p]
    etype = get_block_elevator(p_loc)
    elevator=get_elevator(state, etype)
    # Está dentro del bloque X y  Existe un elevador lento en ese bloque
    if abs(p_loc-g_dest) >= 4 and p_loc < 12  :
        direction = p_loc-g_dest
        return [('call_elevator', etype, elevator,p),('enter_elevator', etype, elevator,p),
                ('move_elevator', etype, elevator,p_loc+1,p),('leave_elevator', etype, elevator,p)]
    return False

def down_one_floor(state, goal,p):
    p_loc = state.passengers[p]
    g_dest = goal.passengers[p]
    etype = get_block_elevator(p_loc)
    elevator=get_elevator(state, etype)
    # Está dentro del bloque X y  Existe un elevador lento en ese bloque
    if abs(p_loc-g_dest) >= 4 and p_loc < 12  :
        direction = p_loc-g_dest
        return [('call_elevator', etype, elevator,p),('enter_elevator', etype, elevator,p),
                ('move_elevator', etype, elevator,p_loc+1,p),('leave_elevator', etype, elevator,p)]
    return False

def travel_limit_level(state, goal,p):
    p_loc = state.passengers[p]
    g_dest = goal.passengers[p]
    # Está dentro del bloque X y  Existe un elevador lento en ese bloque
    if abs(p_loc-g_dest) >= 4 :
        return [('call_elevator', etype, elevator,p),('enter_elevator', etype, elevator,p),
                ('move_elevator', etype, elevator,g_dest,p),('leave_elevator', etype, elevator,p)]
    return False

pyhop.declare_methods('no_direct_path',up_one_floor,down_one_floor,travel_limit_level)



def direct_path(state,goal,who):
    return[('direct_path',goal,who)] 

def no_direct_path(state,goal,who):
    return[('no_direct_path',goal,who)] 

def already_there(state,goal,who):
    p_loc = state.passengers[who]
    g_dest = goal.passengers[who]
    if p_loc == g_dest:
        return[] 
    else:
        return False

pyhop.declare_methods('travel_floor',direct_path,no_direct_path,already_there)


def passenger_travel(state, goal):
    for who in goal.passengers.keys():
        if(not(state.passengers[who] == goal.passengers[who])):
            return [('travel_floor',goal,who)]
    return []

pyhop.declare_methods('passenger_travel',passenger_travel)
print()
pyhop.print_methods()

# INITIAL STATE

state1 = pyhop.State('state1')

state1.passengers = {'c0':4}

state1.elevators={'fast':{'f1':{'capacity':4,'floor':0},'f2':{'capacity':4,'floor':1}},
                  'b1':{'max':4,'min':0,'b10':{'capacity':2,'floor':0},'b11':{'capacity':2,'floor':0}}, 
                  'b2':{'b20':{'capacity':2,'floor':4}}, 
                  'b3':{'b30':{'capacity':2,'floor':8,'max':12,'min':8}}}


# GOAL
goal1 = pyhop.Goal('goal1')
goal1.passengers = {'c0':7}

# print('- If verbose=3, pyhop also prints the intermediate states:')

result = pyhop.pyhop(state1, [('passenger_travel',goal1)], verbose=3)