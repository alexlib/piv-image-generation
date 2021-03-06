function JOBLIST = MonteCarloImageGenerationJobFile_ND()

% Region dimensions
regionHeight = 256;
regionWidth  = 256;
regionDepth  = 64;

DefaultJob.JobOptions.ParallelProcessing = 1;
DefaultJob.JobOptions.NumberOfDigits = 6;
DefaultJob.JobOptions.RotationRangeType = 'lin';
DefaultJob.JobOptions.RotationAngleUnits = 'rad';
DefaultJob.JobOptions.RunCompiled = 1;
DefaultJob.JobOptions.ReSeed = 1;
DefaultJob.JobOptions.SimulateCameras = 0;

DefaultJob.ImageType = 'synthetic';
DefaultJob.SetType = 'mc';
DefaultJob.CaseName = 'piv_test_images';
DefaultJob.ProjectRepository = '~/Desktop/piv_test_images';

DefaultJob.Parameters.RegionHeight = regionHeight;
DefaultJob.Parameters.RegionWidth = regionWidth;
DefaultJob.Parameters.Sets.Start = 1;
DefaultJob.Parameters.Sets.End = 1;
DefaultJob.Parameters.Sets.ImagesPerSet = 1;

% Rigid-body displacements (pixels)
DefaultJob.Parameters.TX = 1 * regionWidth  / 8 * [-1, 1];
DefaultJob.Parameters.TY = 1 * regionHeight / 8 * [-1, 1];
DefaultJob.Parameters.TZ = 1 * regionDepth  / 8 * [-1, 1];

% Range of isotropic scaling factors
DefaultJob.Parameters.Scaling = [1 1]; 

% Range of rotation angles (degrees)
DefaultJob.Parameters.Rotation_Z_01 = 0 * [1 1];
DefaultJob.Parameters.Rotation_Y = 0 * [1 1];
DefaultJob.Parameters.Rotation_Z_02 = 0 * [1 1];

% Shearing
DefaultJob.Parameters.Shear.XY = 0 * [0.00, 0.10];
DefaultJob.Parameters.Shear.XZ = 0 * [1, 1];
DefaultJob.Parameters.Shear.YX = 0 * [0.00, 0.10];
DefaultJob.Parameters.Shear.YZ = 0 * [0.00, 0.10];
DefaultJob.Parameters.Shear.ZX = 0 * [0.00, 0.10];
DefaultJob.Parameters.Shear.ZY = 0 * [0.00, 0.10];

% Range of particle concentrations (particles per pixel)
DefaultJob.Parameters.ParticleConcentration = 1000 * [1 1];

% Particle diameter (pixels)
DefaultJob.Parameters.ParticleDiameter.Mean = sqrt(8);
DefaultJob.Parameters.ParticleDiameter.Std = [0, 0];

% Noise parameters
DefaultJob.Parameters.Noise.Mean = 0.05;
DefaultJob.Parameters.Noise.Std = 0.05;

% Image dimensionality
DefaultJob.Parameters.ImageDimensionalitiy = 2;

% Domain
DefaultJob.Parameters.Domain.X = 0.05 * [-1, 1];
DefaultJob.Parameters.Domain.Y = 0.05 * [-1, 1];
DefaultJob.Parameters.Domain.Z = 0.2 * [-1, 1];

% Standard deviation of the simulated Gaussian beam profile
% in the Z-direction (world coordinates).
DefaultJob.Parameters.Beam.StdDev = 0.5E-2;

% Set the Z center of the beam to lie in the middle of the particle domain.
DefaultJob.Parameters.Beam.WorldCenterZ = 0.03;

% Case 1
SegmentItem = DefaultJob;
SegmentItem.SetType = 'mc';
SegmentItem.CaseName = 'piv_test';
SegmentItem.Parameters.RegionHeight = 128;
SegmentItem.Parameters.RegionWidth  = 128;
SegmentItem.Parameters.RegionDepth = 1;
SegmentItem.Parameters.TX =  10 + rand * [1 1];
SegmentItem.Parameters.TY =  10 + rand * [1 1];
SegmentItem.Parameters.TZ =  0.00 * [0 0];
SegmentItem.Parameters.Scaling = 1 * [1, 1];
SegmentItem.Parameters.ImageNoise.Mean = 0 * [0.1, 0.1];
SegmentItem.Parameters.ImageNoise.StdDev = 0.01 * [1.00, 1.00];
SegmentItem.Parameters.ParticleDiameter.Mean = sqrt(8) * [1, 1];
SegmentItem.Parameters.ParticleDiameter.Std = 0.0  * [1, 1];
SegmentItem.Parameters.ParticleConcentration = 1E-2 * [1, 1];
JOBLIST(1) = SegmentItem;

end








