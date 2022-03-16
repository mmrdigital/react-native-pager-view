import React, { useMemo, useRef, useState } from 'react';
import {
  StyleSheet,
  View,
  SafeAreaView,
  Image,
  Button,
  Alert,
} from 'react-native';

import PagerView from 'react-native-pager-view';

import { LikeCount } from './component/LikeCount';
import { createPage } from './utils';

const pages = [createPage(0), createPage(1), createPage(2)];

export function BasicPagerViewExample() {
  const [opacity, setOpacity] = useState(0);
  const [pageIndex, setPageIndex] = useState(0);
  const ref = useRef();
  function renderPage(page: any) {
    return (
      <View key={`${page.key}}`} style={page.style} collapsable={false}>
        <Image style={styles.image} source={page.imgSource} />
        <LikeCount />
      </View>
    );
  }
  return (
    <SafeAreaView style={styles.container}>
      <Button
        title="setOpacity works"
        onPress={() => {
          setOpacity(opacity + 0.1);
        }}
      />
      <Button
        title="setPageIndex does not work"
        onPress={() => {
          setPageIndex(pageIndex + 1);
        }}
      />
      {/* <Button
        title="ref"
        onPress={() => {
          ref.current.setTotal();
        }}
      /> */}
      <PagerView
        ref={ref}
        //@ts-ignore
        testID="pager-view"
        style={[styles.PagerView, { opacity: opacity }]}
        initialPage={0}
        layoutDirection="ltr"
        pageMargin={10}
        pageIndex={pageIndex}
        // Lib does not support dynamically orientation change
        orientation="horizontal"
        // Lib does not support dynamically transitionStyle change
        transitionStyle="scroll"
        showPageIndicator={false}
      >
        {pages.map((p) => renderPage(p))}
      </PagerView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: 'white',
  },
  image: {
    width: 300,
    height: 200,
    padding: 20,
  },
  PagerView: {
    flex: 1,
  },
});
