disp("Start Up Workshop Environment...")
delete(gcp("nocreate"))

checkcpu = false; 
checkgpu = false; 

% Check Parpool creation
try 
    p = parpool("Threads",2); 
    checkcpu = true; 
catch 
    disp('Failed to create parallel pool. Please check your configuration.');
    p = []; % Assign an empty array to p if the pool creation fails
end
delete(gcp("nocreate"))

% Check GPU device
try 
    gpuDev =  gpuDevice; 
    checkgpu = true; 
catch
    disp('Failed to access GPU device. Please ensure that a compatible GPU is available.');
    gpuDev = []; % Assign an empty array to gpuDev if the GPU device access fails
end

% Display message
if checkgpu && checkcpu
    disp("You are all set!")
     
    % dialogbox = msgbox("You are all set!", "Workshop Environment Chekc","none") ; 

    disp("Hardware resources: ")
    cpuinfo
    gpuDevice   
else 
    disp("Check Failed - This is NOT a valid classroom instance for the Parallel Workshop!")
    % dialogbox = msgbox("Workshop environment check failed","Workshop Environment Chekc","error") ; 
end

clear

% Open main Live Script
edit _StartWorkshop.mlx
