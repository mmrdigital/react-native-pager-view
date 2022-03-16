/**
 * @flow strict-local
 */

import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';
import type { ViewProps } from 'react-native/Libraries/Components/View/ViewPropTypes';
import type {
  WithDefault,
  Int32,
} from 'react-native/Libraries/Types/CodegenTypes';

//TODO implement all types here
type NativeProps = $ReadOnly<{|
  ...ViewProps,
  pageIndex?: WithDefault<Int32, 0>,
|}>;

export default (codegenNativeComponent<NativeProps>(
  'RNCViewPager'
): HostComponent<NativeProps>);
