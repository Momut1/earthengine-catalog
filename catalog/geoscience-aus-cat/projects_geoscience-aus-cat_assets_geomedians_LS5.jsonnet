local id = 'projects/geoscience-aus-cat/assets/geomedians_LS5';
local subdir = 'geoscience-aus-cat';

local ee_const = import 'earthengine_const.libsonnet';
local ee = import 'earthengine.libsonnet';
local spdx = import 'spdx.libsonnet';
local units = import 'units.libsonnet';

local license = spdx.cc_by_4_0;

local version = '3.1.0';

local basename = std.strReplace(id, '/', '_');
local base_filename = basename + '.json';
local self_ee_catalog_url = ee_const.ee_catalog_url + basename;
local catalog_subdir_url = ee_const.catalog_base + subdir + '/';
local parent_url = catalog_subdir_url + 'catalog.json';
local self_url = catalog_subdir_url + base_filename;

{
  'gee:user_uploaded': true,
  stac_version: ee_const.stac_version,
  type: ee_const.stac_type.collection,
  stac_extensions: [
    ee_const.ext_eo,
    ee_const.ext_sci,
    ee_const.ext_ver,
  ],
  id: id,
  version: version,
  title: 'DEA Geometric Median and Median Absolute Deviation - Landsat 5 ' + version,
  'gee:type': ee_const.gee_type.image,
  description: |||
    This product provides statistical tools to exploit the time series of Earth observation data available in Digital Earth Australia, providing annual images of general conditions and how much an area changes for a given year.

    For more information, please see the
    [DEA Geometric Median and Median Absolute Deviation](https://cmi.ga.gov.au/data-products/dea/645/dea-geometric-median-and-median-absolute-deviation-landsat#basics)
  |||,
  license: license.id,
  links: ee.standardLinks(subdir, id) + [
    ee.link.license(license.reference),
    {
      rel: ee_const.rel.cite_as,
      href: 'https://doi.org/10.1109/TGRS.2017.2723896', 'https://doi.org/10.1109/IGARSS.2018.8518312',
      type: ee_const.media_type.html,
    },
    {
      rel: ee_const.rel.source,
      href: 'https://data.dea.ga.gov.au/?prefix=derivative/ga_ls5t_nbart_gm_cyear_3/',
    },
  ],
  keywords: [
    'australia',
    'ga',
    'landsat-derived',
  ],
  providers: [
    ee.producer_provider(
      'Geoscience Australia',
      'https://www.ga.gov.au/'),
    // ee.processor_provider('NGIS', 'https://ngis.com.au/'),
    ee.host_provider(self_ee_catalog_url),
  ],
  extent: ee.extent(
    108.81, -44.41, 157.82, -9.13,
    '1998-01-01T00:00:00Z', '2012-01-01T00:00:00Z'),
  summaries: {
    gsd: [25],
    'eo:bands': [
      {
        name: 'blue',
        description: |||
          Band blue surface reflectance geometric median.
        |||,
        'gee:wavelength': '0.450-0.520 &mu;m',
      },
      {
        name: 'green',
        description: |||
          Band green surface reflectance geometric median.
        |||,
        'gee:wavelength': '0.520-0.600 &mu;m',
      },
      {
        name: 'red',
        description: |||
          Band red surface reflectance geometric median.
        |||,
        'gee:wavelength': '0.630-0.690 &mu;m',
      },
      {
        name: 'near_infrared',
        description: |||
          Band near infrared surface reflectance geometric median.
        |||,
        'gee:wavelength': '0.760-0.900 &mu;m',
      },
      {
        name: 'shortwave_infrared_1',
        description: |||
          Band shortwave infrared 1 surface reflectance geometric median.
        |||,
        'gee:wavelength': '1.550-1.750 &mu;m',
      },
      {
        name: 'shortwave_infrared_2',
        description: |||
          Band shortwave infrared 2 surface reflectance geometric median.
        |||,
        'gee:wavelength': '2.080-2.350 &mu;m',
      },
      {
        name: 'Euclidean_distance_median_absolute_deviation',
        description: |||
          The Median Absolute Deviation using Euclidean distance (EMAD). EMAD is more sensitive to changes in target brightness.
          [Band details](https://cmi.ga.gov.au/data-products/dea/645/dea-geometric-median-and-median-absolute-deviation-landsat#details)
        |||,
      },
      {
        name: 'spectral_distance_median_absolute_deviation',
        description: |||
          The Median Absolute Deviation using Cosine (spectral) distance (SMAD). SMAD is more sensitive to change in target spectral response.
          [Band details](https://cmi.ga.gov.au/data-products/dea/645/dea-geometric-median-and-median-absolute-deviation-landsat#details)
        |||,
      },
      {
        name: 'Bray_Curtis_dissimilarity_median_absolute_deviation',
        description: |||
          The Median Absolute Deviation using Bray Curtis dissimilarity (BCMAD). BCMAD is more sensitive to the distribution of the observation values through time.
          [Band details](https://cmi.ga.gov.au/data-products/dea/645/dea-geometric-median-and-median-absolute-deviation-landsat#details)
        |||,
      },
      {
        name: 'count',
        description: |||
          The number of the available pixels used for calculation per calendar year.
          [Band details](https://cmi.ga.gov.au/data-products/dea/645/dea-geometric-median-and-median-absolute-deviation-landsat#details)
        |||,
      },
    ],
    blue: {minimum: 0, maximum: 10000, 'gee:estimated_range': true},
    green: {minimum: 0, maximum: 10000, 'gee:estimated_range': true},
    red: {minimum: 0, maximum: 10000, 'gee:estimated_range': true},
    near_infrared: {minimum: 0, maximum: 10000, 'gee:estimated_range': true},
    shortwave_infrared_1: {minimum: 0, maximum: 10000, 'gee:estimated_range': true},
    shortwave_infrared_2: {minimum: 0, maximum: 10000, 'gee:estimated_range': true},
    shortwave_infrared_2: {minimum: 0, maximum: 10000, 'gee:estimated_range': true},
    Euclidean_distance_median_absolute_deviation: {minimum: 0, maximum: 10000, 'gee:estimated_range': true},
    spectral_distance_median_absolute_deviation: {minimum: 0, maximum: 10000, 'gee:estimated_range': true},
    Bray_Curtis_dissimilarity_median_absolute_deviation: {minimum: 0, maximum: 10000, 'gee:estimated_range': true},
    'gee:visualizations': [
      {
        display_name: 'Geomedians',
        lookat: {lon: 133.88, lat: -23.70, zoom: 5},
        image_visualization: {
          band_vis: {
            min: [0],
            max: [255],
            bands: ['B03', 'B02', 'B01'],
          }
        },
      },
    ],
  },
  'sci:doi': '10.1109/TGRS.2017.2723896', '10.1109/IGARSS.2018.8518312'
  'sci:citation': |||
    Roberts, D., Mueller, N., & Mcintyre, A. (2017). High-dimensional pixel composites from earth observation time series. IEEE Transactions on Geoscience and Remote Sensing, 55(11), 6254-6264.
    [doi:10.1109/TGRS.2017.2723896](https://doi.org/10.1109/TGRS.2017.2723896).
    Roberts, D., Dunn, B., & Mueller, N. (2018). Open data cube products using high-dimensional statistics of time series. IGARSS 2018 - 2018 IEEE International Geoscience and Remote Sensing Symposium, 8647-8650.
    [doi:10.1109/IGARSS.2018.8518312](https://doi.org/10.1109/IGARSS.2018.8518312).
  |||,
  'gee:terms_of_use': ee.gee_terms_of_use(license),
}
