%% April 2025, MATLAB R2024b, The MathWorks Inc., Natick, MA, USA
%% This was directly taken from https://github.com/fooof-tools/fooof_mat.


function fooof_results = fooof(freqs, original_spectrum, f_range, settings, return_model)

    % Check settings - get defaults for those not provided
    settings = fooof_check_settings(settings);

    % **Before conversion to numpy**: Print the power_spectrum in Matlab
   % disp('Original power spectrum (Matlab):');
   % disp(original_spectrum); % This prints the original power spectrum in Matlab

    % Convert inputs
    freqs = py.numpy.array(freqs);
    power_spectrum = py.numpy.array(original_spectrum);
    f_range = py.list(f_range);

    % Initialize FOOOF object
    fm = py.fooof.FOOOF(settings.peak_width_limits, ...
                        settings.max_n_peaks, ...
                        settings.min_peak_height, ...
                        settings.peak_threshold, ...
                        settings.aperiodic_mode, ...
                        settings.verbose);

    % Run FOOOF fit
    fm.fit(freqs, power_spectrum, f_range)
    
    % Extract outputs
    fooof_results = fm.get_results();

    % Re-calculating r-squared
    coefs = corrcoef(double(py.array.array('d', fm.power_spectrum)), ...
                     double(py.array.array('d', fm.fooofed_spectrum_)));
    fooof_results.r_squared = coefs(2);

    % Also return the actual model fit, if requested
    if exist('return_model', 'var') && return_model

        % Get the model, and add outputs to fooof_results
        model_out = fooof_get_model(fm);
        for field = fieldnames(model_out)'
            fooof_results.(field{1}) = model_out.(field{1});
        end

    end

end
