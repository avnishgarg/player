class Images {
  String? waveformM;
  String? waveformL;
  String? spectralM;
  String? spectralL;
  String? waveformBwM;
  String? waveformBwL;
  String? spectralBwM;
  String? spectralBwL;

  Images({
    this.waveformM,
    this.waveformL,
    this.spectralM,
    this.spectralL,
    this.waveformBwM,
    this.waveformBwL,
    this.spectralBwM,
    this.spectralBwL,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        waveformM: json['waveform_m'] as String?,
        waveformL: json['waveform_l'] as String?,
        spectralM: json['spectral_m'] as String?,
        spectralL: json['spectral_l'] as String?,
        waveformBwM: json['waveform_bw_m'] as String?,
        waveformBwL: json['waveform_bw_l'] as String?,
        spectralBwM: json['spectral_bw_m'] as String?,
        spectralBwL: json['spectral_bw_l'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'waveform_m': waveformM,
        'waveform_l': waveformL,
        'spectral_m': spectralM,
        'spectral_l': spectralL,
        'waveform_bw_m': waveformBwM,
        'waveform_bw_l': waveformBwL,
        'spectral_bw_m': spectralBwM,
        'spectral_bw_l': spectralBwL,
      };
}
