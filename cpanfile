requires 'perl', '5.008001';

on 'test' => sub {
    requires 'IO::CaptureOutput';
    requires 'Mouse';
    requires 'Sub::Retry';
    requires 'Test::Docker::Image';
    requires 'Test::LeakTrace';
    requires 'Test::More', '0.98';
    requires 'Test::SharedFork';
};

on 'configure' => sub{
    requires 'File::Spec';
    requires 'File::Which';
    requires 'File::chdir';
    requires 'Module::Build::XSUtil' => '>=0.02';
};