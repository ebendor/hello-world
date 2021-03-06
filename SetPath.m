function SetPath()
  %   Add application paths to matlab path variable
  %
  % AUTHOR:       Sean Lynch
  % VERSION:      $Header:  $
  %
  % COPYRIGHT (C) 2015 Qualcomm Technologies INC.
  %  All rights reserved. Commercial in Confidence.
  %  Qualcomm Confidential and Proprietary
  %

  % Delete any existing objects
  evalin('base', 'clear');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% If the code has been released (.p) - do nothing
%
if exist(mfilename(), 'file') == 6
  fprintf('%s: release mode\n', mfilename());
  return;
end;

%
% Wipe the existing path
%
restoredefaultpath;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Install path for applications and libraries. %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

libDirectories= {...
  'libs' ...
  'libs\analyse-etse' ...
  'libs\common' ...
  'libs\drivers' ...
  'libs\drivers-int' ...
  'libs\examples' ...
  'libs\guis' ...
  'libs\graphics' ...
  'libs\maths' ...
  'libs\release' ...
  'libs\sys_mdls' ...
  'libs\et-surface-analyzer' ...
  'libs\et-surface-analyzer-gui' ...
  'libs\et-surface-explorer' ...
  'libs\tracking-analysis' ...
  'libs\utils' ...
  'libs\etts' ...
  'libs\etts\gui' ...
  'libs\etts\libs' ...
  'libs\etts\libs\excel' ...
  'libs\etts\libs\equipement' ...
  'libs\etts\libs\equipement\RFFE\Shared' ...
  'libs\etts\libs\wvfile_tools' ...
  'libs\etts\scripts\PA_scripts\Master_scripts' ...
  'libs\etts\qualcomm\bas' ...
  'libs\etts\qualcomm\nujdpd' ...
  'libs\etts\qualcomm\libs' ...
};

%
% OS dependent drivers
%

archstr = computer('arch');
switch archstr
  case 'win32';
    %libDirectories{end+1} = 'work\resources\win32';

  case 'win64';    
    %libDirectories{end+1} = 'work\resources\win64';

  otherwise;
    fprintf('%s: archstr is not supported: %s', mfilename, archstr);
    return;
end;

% Drop the lower directories & file name off the path
myPath = fileparts(mfilename('fullpath'));
addpath(myPath);

for i = 1:length(libDirectories),
 file = fullfile(myPath, libDirectories{i});
 if exist(file, 'dir'),
   %addpath(file, '-FROZEN');
   addpath(file);
 end
end

