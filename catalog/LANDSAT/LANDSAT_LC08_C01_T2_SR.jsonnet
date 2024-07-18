local id = 'LANDSAT/LC08/C01/T2_SR';

local subdir = 'LANDSAT';

local ee_const = import 'earthengine_const.libsonnet';
local ee = import 'earthengine.libsonnet';
local spdx = import 'spdx.libsonnet';
local units = import 'units.libsonnet';

local license = spdx.proprietary;
local versions = import 'versions.libsonnet';
local version_table = import 'LC8_T2_L2_versions.libsonnet';
local version_config = versions(subdir, version_table, id);
local version = version_config.version;
{
  "gee:skip_indexing": true,
  stac_version: ee_const.stac_version,
  type: ee_const.stac_type.collection,
  stac_extensions: [
    ee_const.ext_eo,
    ee_const.ext_ver
  ],
  id: id,
  title: 'USGS Landsat 8 Surface Reflectance Tier 2 [deprecated]',
  deprecated: true,
  'gee:type': ee_const.gee_type.image_collection,
  description: |||
    This dataset is the atmospherically corrected
    surface reflectance from the Landsat 8 OLI/TIRS sensors.
    These images contain 5 visible and near-infrared (VNIR) bands and
    2 short-wave infrared (SWIR) bands processed to orthorectified surface
    reflectance, and two thermal infrared (TIR) bands processed to orthorectified
    brightness temperature

    These data have been atmospherically corrected using
    [LaSRC](https://prd-wret.s3.us-west-2.amazonaws.com/assets/palladium/production/atoms/files/LSDS-1368_L8_C1-LandSurfaceReflectanceCode-LASRC_ProductGuide-v3.pdf)
    and includes a cloud, shadow, water and snow mask produced using
    [CFMASK](https://www.usgs.gov/core-science-systems/nli/landsat/cfmask-algorithm),
    as well as a per-pixel saturation mask.

    Strips of collected data are packaged into overlapping "scenes" covering approximately
    170km x 183km using a [standardized reference grid](https://landsat.gsfc.nasa.gov/about/worldwide-reference-system).

    See also [the USGS page on SR QA bands](https://www.usgs.gov/land-resources/nli/landsat/landsat-surface-reflectance-quality-assessment).

    SR can only be produced for Landsat assets processed to the
    [L1TP level](https://www.usgs.gov/land-resources/nli/landsat/landsat-levels-processing)

    Data provider notes:

    - Although Surface Reflectance can be processed only from the Operational
      Land Imager (OLI) bands, SR requires combined OLI/Thermal Infrared
      Sensor (TIRS) product (LC8) input in order to generate the accompanying
      cloud mask. Therefore, OLI only (LO8), and TIRS only (LT8) data products
      cannot be calculated to SR.
    - SR is not run for a scene with a solar zenith angle greater than 76&deg;.
    - Users are cautioned to avoid using SR for data acquired
      over high latitudes (&gt; 65&deg;).
    - The panchromatic band (ETM+ Band 7, OLI Band 8) is not processed to
      Surface Reflectance.
    - Efficacy of SR correction will be likely reduced in areas where atmospheric
      correction is affected by adverse conditions:
        - Hyper-arid or snow-covered regions
        - Low sun angle conditions
        - Coastal regions where land area is small relative to adjacent water
        - Areas with extensive cloud contamination

    This product is generated by Google using a Docker image supplied by USGS.
  |||,
  license: license.id,
  links: ee.standardLinks(subdir, id) + version_config.version_links,
  keywords: [
    'cfmask',
    'cloud',
    'fmask',
    'global',
    'l8sr',
    'landsat',
    'lc08',
    'reflectance',
    'sr',
    'usgs',
  ],
  providers: [
    ee.producer_provider('USGS', 'https://www.usgs.gov/core-science-systems/nli/landsat/landsat-surface-reflectance'),
    ee.host_provider(version_config.ee_catalog_url),
  ],
  extent: ee.extent_global('2013-03-18T15:58:14Z', null),
  summaries: {
    'gee:schema': [
      {
        name: 'CLOUD_COVER',
        description: 'Percentage cloud cover (0-100), -1 = not calculated.\n(Obtained from raw Landsat metadata)',
        type: ee_const.var_type.double,
      },
      {
        name: 'CLOUD_COVER_LAND',
        description: 'Percentage cloud cover over land (0-100), -1 = not calculated.\n(Obtained from raw Landsat metadata)',
        type: ee_const.var_type.double,
      },
      {
        name: 'EARTH_SUN_DISTANCE',
        description: 'Earth-Sun distance (AU)',
        type: ee_const.var_type.double,
      },
      {
        name: 'ESPA_VERSION',
        description: 'Internal ESPA image version used to compute SR',
        type: ee_const.var_type.string,
      },
      {
        name: 'GEOMETRIC_RMSE_MODEL',
        description: |||
          Combined RMSE (Root Mean Square Error) of the geometric
              residuals (meters) in both across-track and along-track
              directions. (Obtained from raw Landsat metadata)
        |||,
        type: ee_const.var_type.double,
      },
      {
        name: 'GEOMETRIC_RMSE_MODEL_X',
        description: |||
          RMSE (Root Mean Square Error) of the geometric residuals (meters)
              measured on the GCPs (Ground Control Points) used in geometric
              precision correction in the across-track direction.
              (Obtained from raw Landsat metadata)
        |||,
        type: ee_const.var_type.double,
      },
      {
        name: 'GEOMETRIC_RMSE_MODEL_Y',
        description: |||
          RMSE (Root Mean Square Error) of the geometric residuals (meters)
              measured on the GCPs (Ground Control Points) used in geometric
              precision correction in the along-track direction.
              (Obtained from raw Landsat metadata)
        |||,
        type: ee_const.var_type.double,
      },
      {
        name: 'IMAGE_QUALITY',
        description: 'Image quality, 0 = worst, 9 = best, -1 = quality not calculated.\n(Obtained from raw Landsat metadata)',
        type: ee_const.var_type.int,
      },
      {
        name: 'LANDSAT_ID',
        description: 'Landsat Product Identifier (Collection 1)',
        type: ee_const.var_type.string,
      },
      {
        name: 'LEVEL1_PRODUCTION_DATE',
        description: 'Date of production for raw Level 1 data as ms since epoch',
        type: ee_const.var_type.int,
      },
      {
        name: 'PIXEL_QA_VERSION',
        description: "Version of the software used to produce the 'pixel_qa' band",
        type: ee_const.var_type.string,
      },
      {
        name: 'SATELLITE',
        description: 'Name of satellite',
        type: ee_const.var_type.string,
      },
      {
        name: 'SENSING_TIME',
        description: 'Time of the observations as in ISO 8601 string.\n(Obtained from raw Landsat metadata)',
        type: ee_const.var_type.string,
      },
      {
        name: 'SOLAR_AZIMUTH_ANGLE',
        description: 'Solar azimuth angle',
        type: ee_const.var_type.double,
      },
      {
        name: 'SR_APP_VERSION',
        description: 'LaSRC version used to process surface reflectance',
        type: ee_const.var_type.string,
      },
      {
        name: 'WRS_PATH',
        description: 'WRS path number of scene',
        type: ee_const.var_type.int,
      },
      {
        name: 'WRS_ROW',
        description: 'WRS row number of scene',
        type: ee_const.var_type.int,
      },
    ],
    gsd: [
      30.0,
    ],
    'eo:bands': [
      {
        name: 'B1',
        description: 'Band 1 (ultra blue) surface reflectance',
        center_wavelength: 0.443,
        'gee:scale': 0.0001,
        'gee:wavelength': '0.435-0.451 &mu;m',
      },
      {
        name: 'B2',
        description: 'Band 2 (blue) surface reflectance',
        center_wavelength: 0.482,
        'gee:scale': 0.0001,
        'gee:wavelength': '0.452-0.512 &mu;m',
      },
      {
        name: 'B3',
        description: 'Band 3 (green) surface reflectance',
        center_wavelength: 0.562,
        'gee:scale': 0.0001,
        'gee:wavelength': '0.533-0.590 &mu;m',
      },
      {
        name: 'B4',
        description: 'Band 4 (red) surface reflectance',
        center_wavelength: 0.655,
        'gee:scale': 0.0001,
        'gee:wavelength': '0.636-0.673 &mu;m',
      },
      {
        name: 'B5',
        description: 'Band 5 (near infrared) surface reflectance',
        center_wavelength: 0.865,
        'gee:scale': 0.0001,
        'gee:wavelength': '0.851-0.879 &mu;m',
      },
      {
        name: 'B6',
        description: 'Band 6 (shortwave infrared 1) surface reflectance',
        center_wavelength: 1.609,
        'gee:scale': 0.0001,
        'gee:wavelength': '1.566-1.651 &mu;m',
      },
      {
        name: 'B7',
        description: 'Band 7 (shortwave infrared 2) surface reflectance',
        center_wavelength: 2.201,
        'gee:scale': 0.0001,
        'gee:wavelength': '2.107-2.294 &mu;m',
      },
      {
        name: 'B10',
        description: |||
          Band 10 brightness temperature. This band, while originally
          collected with a resolution of 100m / pixel, has been resampled using
          cubic convolution to 30m.
        |||,
        'gee:units': units.kelvin,
        center_wavelength: 10.895,
        'gee:scale': 0.1,
        'gee:wavelength': '10.60-11.19 &mu;m',
      },
      {
        name: 'B11',
        description: |||
          Band 11 brightness temperature. This band, while originally
          collected with a resolution of 100m / pixel, has been resampled using
          cubic convolution to 30m.
        |||,
        'gee:units': units.kelvin,
        center_wavelength: 12.005,
        'gee:scale': 0.1,
        'gee:wavelength': '11.50-12.51 &mu;m',
      },
      {
        name: 'sr_aerosol',
        description: 'Aerosol attributes',
        'gee:bitmask': {
          bitmask_parts: [
            {
              description: 'Fill',
              bit_count: 1,
              first_bit: 0,
            },
            {
              description: 'Aerosol retrieval - valid',
              first_bit: 1,
              bit_count: 1,
            },
            {
              description: 'Aerosol retrieval - interpolated',
              first_bit: 2,
              bit_count: 1,
            },
            {
              description: 'Water pixel',
              first_bit: 3,
              bit_count: 1,
            },
            {
              description: 'Water aerosol retrieval failed - needs interpolated',
              first_bit: 4,
              bit_count: 1,
            },
            {
              description: 'Neighbor of failed aerosol retrieval',
              first_bit: 5,
              bit_count: 1,
            },
            {
              description: 'Aerosol content',
              first_bit: 6,
              bit_count: 2,
              values: [
                {
                  description: 'Climatology',
                  value: 0,
                },
                {
                  value: 1,
                  description: 'Low',
                },
                {
                  value: 2,
                  description: 'Medium',
                },
                {
                  value: 3,
                  description: 'High',
                },
              ],
            },
          ],
          total_bit_count: 8,
        },
      },
      {
        name: 'pixel_qa',
        description: 'Pixel quality attributes generated from the CFMASK algorithm.',
        'gee:bitmask': {
          bitmask_parts: [
            {
              description: 'Fill',
              bit_count: 1,
              first_bit: 0,
            },
            {
              description: 'Clear',
              first_bit: 1,
              bit_count: 1,
            },
            {
              description: 'Water',
              first_bit: 2,
              bit_count: 1,
            },
            {
              description: 'Cloud Shadow',
              first_bit: 3,
              bit_count: 1,
            },
            {
              description: 'Snow',
              first_bit: 4,
              bit_count: 1,
            },
            {
              description: 'Cloud',
              first_bit: 5,
              bit_count: 1,
            },
            {
              description: 'Cloud Confidence',
              first_bit: 6,
              bit_count: 2,
              values: [
                {
                  description: 'None',
                  value: 0,
                },
                {
                  value: 1,
                  description: 'Low',
                },
                {
                  value: 2,
                  description: 'Medium',
                },
                {
                  value: 3,
                  description: 'High',
                },
              ],
            },
            {
              description: 'Cirrus Confidence',
              first_bit: 8,
              bit_count: 2,
              values: [
                {
                  description: 'None',
                  value: 0,
                },
                {
                  value: 1,
                  description: 'Low',
                },
                {
                  value: 2,
                  description: 'Medium',
                },
                {
                  value: 3,
                  description: 'High',
                },
              ],
            },
            {
              description: 'Terrain Occlusion',
              first_bit: 10,
              bit_count: 1,
            },
          ],
          total_bit_count: 11,
        },
      },
      {
        name: 'radsat_qa',
        description: 'Radiometric saturation QA',
        'gee:bitmask': {
          bitmask_parts: [
            {
              description: 'Data Fill Flag',
              bit_count: 1,
              values: [
                {
                  description: 'Valid data',
                  value: 0,
                },
                {
                  value: 1,
                  description: 'Invalid data',
                },
              ],
              first_bit: 0,
            },
            {
              description: 'Band 1 data saturated',
              first_bit: 1,
              bit_count: 1,
            },
            {
              description: 'Band 2 data saturated',
              first_bit: 2,
              bit_count: 1,
            },
            {
              description: 'Band 3 data saturated',
              first_bit: 3,
              bit_count: 1,
            },
            {
              description: 'Band 4 data saturated',
              first_bit: 4,
              bit_count: 1,
            },
            {
              description: 'Band 5 data saturated',
              first_bit: 5,
              bit_count: 1,
            },
            {
              description: 'Band 6 data saturated',
              first_bit: 6,
              bit_count: 1,
            },
            {
              description: 'Band 7 data saturated',
              first_bit: 7,
              bit_count: 1,
            },
            {
              description: 'Unused',
              first_bit: 8,
              bit_count: 1,
            },
            {
              description: 'Band 9 data saturated',
              first_bit: 9,
              bit_count: 1,
            },
            {
              description: 'Band 10 data saturated',
              first_bit: 10,
              bit_count: 1,
            },
            {
              description: 'Band 11 data saturated',
              first_bit: 11,
              bit_count: 1,
            },
          ],
          total_bit_count: 12,
        },
      },
    ],
    'gee:visualizations': [
      {
        display_name: 'True Color (432)',
        lookat: {
          lon: 6.746,
          lat: 46.529,
          zoom: 6,
        },
        image_visualization: {
          band_vis: {
            min: [
              0.0,
            ],
            max: [
              30000.0,
            ],
            bands: [
              'B4',
              'B3',
              'B2',
            ],
          },
        },
      },
      {
        display_name: 'Near Infrared (543)',
        lookat: {
          lon: 6.746,
          lat: 46.529,
          zoom: 6,
        },
        image_visualization: {
          band_vis: {
            min: [
              0.0,
            ],
            max: [
              30000.0,
            ],
            bands: [
              'B5',
              'B4',
              'B3',
            ],
          },
        },
      },
      {
        display_name: 'Shortwave Infrared (753)',
        lookat: {
          lon: 6.746,
          lat: 46.529,
          zoom: 6,
        },
        image_visualization: {
          band_vis: {
            min: [
              0.0,
            ],
            max: [
              30000.0,
            ],
            bands: [
              'B7',
              'B5',
              'B3',
            ],
          },
        },
      },
    ],
  },
  'gee:interval': {
    type: 'revisit_interval',
    unit: 'day',
    interval: 16,
  },
  'gee:terms_of_use': importstr 'terms_of_use.md',
  version: version
}
