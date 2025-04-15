import numpy as np
from scipy import pi

def calculate_diffusion_constant(T_kelvin, dp_microns, viscosity_pas):
    """
    Calculate the diffusion coefficient in microns^2 / sec.
    """
    
    # Boltzmann's constant (m^2 * kg / (s^2 * K))
    kb = 1.38064852e-23
    
    # Particle diameter in meters
    dp_meters = dp_microns / 1e6
    
    # Calculate diffusion (m^2 / s)
    # The factor of 1e12 converts meters^2 to microns^2
    diffusion_constant = kb * T_kelvin / (3 * pi * viscosity_pas * dp_meters)
    
    return diffusion_constant