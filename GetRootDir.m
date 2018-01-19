function rootDir = GetRootDir()
  %
  % function rootDir = getRootDir()
  %
  % PARAMETERS/RETURNS
  %   rootDir - location of the root directory
  %
  % DESCRIPTION
  %   Function used to locate the root directory of the code
  %   
  % AUTHOR:       Sean Lynch
  % VERSION:      $Header:  $
  %
  % COPYRIGHT (C) 2015 Qualcomm Technologies INC.
  %  All rights reserved. Commercial in Confidence.
  %  Qualcomm Confidential and Proprietary
  %

%%
% Main function
%
[path, unused, ext] = fileparts(which(mfilename('fullpath'))); %#ok

if isdeployed
  % This code is running as a stand alone Matlab program
  % Cannot use the location of the .p file.
  % use the current working diretcory as this should be set to "work"
  rootDir = pwd();
else
  % Are we a released .p or development .m file

  if strcmp(ext, '.p')
    % Released code - use the PWD which should be set to work
    rootDir = pwd();
  else
    % Development code - use location of .m file
    rootDir = path;
  end;
end;

%fprintf('\n PWD  = [%s]', pwd());
%fprintf('\n ROOT = [%s] [%s] [%s]', path, name, ext);
%fprintf('\n getRootDir() => %s\n', rootDir);
return;

%%
% END OF FILE
%
