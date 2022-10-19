# Example
In the figure below, we see a simple system. Water can be pumped uphill by the pump. Or, water can flow downhill through the turbine. We are going to assume, for the sake of simplicity, that the *performance curve* of the pump is the same as the turbine. In other words, the turbine is a perfect *reverse image* of the pump. Next, we are not going to worry about pump or turbine in-efficiencies; we are just going to deal with theoretical values of supplied pump power and extracted turbine power.

In the supplied [code](pumped_hydro.m) you will see that I have selected physical parameters (pipe length, diameter, etc.) and pump/turbine performance curve parameters. You can adjust these a bit, but not much. Doing so will quickly violate (fully turbulent flow regime, etc.) one or more of the assumptions that I made in order to create this simple exercise.

In the end, the neat thing is comparing the power consumed by the pump to the power extracted by the turbine. Due to friction losses, the turbine power will be less of course (no free lunch). Whether or not a pumped hydro project is a money maker, therefore, will depend on the cost per kilowatt-hour associated with the power consumption (by the pump) and the power generation (by the turbine). Definitely a fun optimization problem to think about.

![example](/figures/Q1.png)
