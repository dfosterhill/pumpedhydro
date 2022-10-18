# Theoretical Development
## Uphill (pump) Phase
Ok, let us begin with the figure below. There are two large reservoirs of water and a pump is going to be used to move the water from the lower reservoir to the upper reservoir. The pipe length is $L$, the pipe diameter is $d$, the *roughness height* of the pipe material (cast iron, steel, etc.) is $\epsilon$, and there is an elevation difference of $\Delta z = z_{2}-z_{1}$ between the reservoir free surfaces.

![schematic](/figures/pumpflow.png)

Next, we will assume that the pump supplies a head of $h_{p}$ to the water, and that the pump power is $P=\gamma h_{p} Q$, where $\gamma$ is the specific weight of water ( $\gamma = \rho g$, with $\rho$ being the water density) and $Q$ is the volumetric flow rate of water through the pipe. For the purposes of simplicity here, we will not worry about pump efficiency, and we will just assume a perfect efficiency of 1.

### Energy Equation
Where to start? Well, to solve this problem, we need to apply the work-energy equation between locations 1 and 2. This is given by

$$ \frac{p_{1}}{\gamma}+\frac{V_{1}^{2}}{2}+z_{1}+h_{p}=\frac{p_{2}}{\gamma}+\frac{V_{2}^{2}}{2}+z_{2}+h_{f}+\sum h_{L} $$

In this equation, $p$ refers to pressure, $V$ is velocity, $h_{f}$ is the friction loss, and $h_{L}$ refers to *local* losses, such as entrance effects, or other. For us to proceed, we are going to assume the following:

1. The air pressures at the two free surfaces are equal, so they cancel.
2. The velocities of the reservoir free surfaces (one moves slowly up, the other down) are very small and can be ignored.
3. Local losses are small compared to friction losses, and can be ignored.

Thus, our equation becomes:

$$ h_{p}=\Delta z+h_{f} $$

### Pipe Friction Losses
Next, we need a model for friction losses, and we use the [Darcy Weisbach](https://en.wikipedia.org/wiki/Darcy%E2%80%93Weisbach_equation#Head-loss_form) equation which states that

$$ h_{f}=f\frac{L}{d}\frac{V_{2}}{2g} $$

Note that in this equation the $V$ is the velocity of the water in the pipe, which is different from the velocities of the reservoir free surfaces which we ignored in the work-energy equation above.

### Pipe Friction Factors
What's $f$ and how do we find it? Refer to the figure below, which is the Moody Diagram.

![moody](/figures/moody.jpg)

In this diagram, the black lines are *contour lines* of constant relative roughness $\epsilon/d$. Note that values of $\epsilon/d$ are shown on the right vertical axis. The horizontal axis shows values of the Reynolds number, i.e. $Re = Vd/\nu$ where $\nu$ is the kinematic viscosity of water, which is also equal to $\nu=\mu/\rho$ where $\mu$ is the dynamic viscosity of water. To use the Moody Diagram, you need to know $Re$ and $\epsilon/d$. From $\epsilon/d$, find the correct black curve. From $Re$, move upwards until you intersect that black curve. Then, go left and read off the value of $f$.

Now, if you don't like to use diagrams, that is ok. You can use the [Haaland equation](https://en.wikipedia.org/wiki/Darcy_friction_factor_formulae#Haaland_equation) given by

$$ \frac{1}{\sqrt{f}} = -1.8 \log \biggl[\biggl(\frac{\epsilon/d}{3.7}\biggr)^{1.11} + \frac{6.9}{Re}\biggr] $$

So, if you know $\epsilon/d$ and $Re$, you can quickly get $f$. Our example above is a Type 2 pipe flow problem. What does that mean? For us to solve for $Q$ we will need to know $f$. And to know $f$, we need to know $Re$. And, to get $Re$, we need to know $V$, which is given by $V = Q / A = 4Q/(\pi d^{2})$. So, to find $Q$, we need to know $Q$, siggggghhh. This is a little bit of a pain, but we can get around with with some reasonable assumptions. If you look at the Moody Diagram, you will note that, for any given $\epsilon/d$ curve, the curve is essentially flat for a large range of $Re$. This is the *fully turbulent* regime. This means that, in this range of $Re$, the friction factor $f$ does not depend on Re, which means that it does not depend on $V$ or $Q$. In this fully turbulent regime, the Haaland Equation simplifies to:

$$ \frac{1}{\sqrt{f}} = -1.8 \log \biggl[\biggl(\frac{\epsilon/d}{3.7}\bigg)^{1.11}\biggr] $$

Great. This assumption is useful, but is it valid? For large scale pipe flow applications, it generally is. Fantastic. 

### Pump Performance Curve
There is one final thing that we need. A given pump will have a head $h_{p}$ that varies with the flowrate going through it. As shown below, this *pump performance curve* is often similar to an upside-down quadratic shape. Some times, we are given tables of data about how $h_{p}$ and $Q$ vary with each other and we can use this information to develop an approach quadratic curve fit. In other words, we will generate an equation that looks like

$$ h_{p} = A - BQ^{2} $$

![pump performance curve](/figures/pump.png)

### Summary
In summary, therefore we have the following collection of equations that are to be solved:

| Name | Formula|
| --- | --- |
| Energy  | $h_{p}=\Delta z + h_{f}$ |
| Darcy-Weisbach | $h_{f} = f\frac{L}{d} \frac{V^{2}}{2g}$ |
| Pump Power | $P=\gamma h_{p} Q = \gamma h_{p} V \frac{\pi}{4}d^{2}$ |
| Friction Factor (Haaland) | $\frac{1}{\sqrt{f}} = -1.8 \log \biggl[\biggl(\frac{\epsilon/d}{3.7}\bigg)^{1.11}\biggr]$ |
| Pump Performance | $h_{p} = A - BQ^{2}$ |
| Flowrate / Velocity | $Q = VA$ |

The following are typically known:
1. Elevation difference $\Delta z$
2. Roughness height $\epsilon
3. Pipe diameter $d$
4. Pump power $P$
5. Pipe length $L$
6. Fluid specific weight $\gamma$

The six equations above are used to solve for the following:
1. Pump head $h_{p}$
2. Friction head loss $h_{f}$
3. Friction factor $f$
4. Fluid velocity $V$
5. Volumetric flow rate $Q$
6. Pump power $P$

## Downhill (turbine) Phase
So, when the water flows back downhill, what changes? Astonishingly little. In this case, the energy equation becomes 

$$h_{t}=\Delta z - h_{f}$$

where $h_{t}$ is the head extracted by the turbine. We have a similar turbomachine power equation, i.e. $P=\gamma h_{t}Q$. Everything else is pretty much the same!
