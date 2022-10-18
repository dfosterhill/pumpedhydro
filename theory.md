# Theoretical Development
Ok, let us begin with the figure below. There are two large reservoirs of water and a pump is going to be used to move the water from the lower reservoir to the upper reservoir. The pipe length is $L$, the pipe diameter is $d$, the *roughness height* of the pipe material (cast iron, steel, etc.) is $\epsilon$, and there is an elevation difference of $\Delta z = z_{2}-z_{1}$ between the reservoir free surfaces.

![schematic](/figures/pumpflow.png)

Next, we will assume that the pump supplies a head of $h_{p}$ to the water, and that the pump power is $P=\gamma h_{p} Q$, where $\gamma$ is the specific weight of water ($\gamma = \rho g$, with $\rho$ being the water density) and $Q$ is the volumetric flow rate of water through the pipe. For the purposes of simplicity here, we will not worry about pump efficiency, and we will just assume a perfect efficiency of 1.

So, this is an example of a *Type 2* pipe flow problem where the water velocity $V$ (and thus $Q$) is not known at the outset of the analysis. Why is this complicated? It means that we don't really know what the friction factor $f$ is, and we need that. What's $f$ and how do we find it? 
